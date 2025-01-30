const SQLITE_CREATE_STR = [
    """
CREATE TABLE area (
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	obj_type TEXT NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (name)
)
""",
    """
    CREATE TABLE arc (
        id INTEGER NOT NULL,
        from_id INTEGER NOT NULL,
        to_id INTEGER NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY(from_id) REFERENCES balancing_topology (id),
        FOREIGN KEY(to_id) REFERENCES balancing_topology (id)
    )
    """,
    """
    CREATE TABLE attributes (
    	id INTEGER NOT NULL,
    	entity_id INTEGER NOT NULL,
    	entity_type TEXT NOT NULL,
    	"key" TEXT NOT NULL,
    	value JSON NOT NULL,
    	PRIMARY KEY (id)
    )
    """,
    """
    CREATE TABLE balancing_topology (
    	id INTEGER NOT NULL,
    	name TEXT NOT NULL,
    	obj_type TEXT NOT NULL,
    	area_id INTEGER,
    	PRIMARY KEY (id),
    	UNIQUE (name),
    	FOREIGN KEY(area_id) REFERENCES area (id)
    )
    """,
    """
    CREATE TABLE generation_unit (
    	id INTEGER NOT NULL,
    	name TEXT NOT NULL,
    	obj_type TEXT NOT NULL,
    	prime_mover TEXT,
    	fuel_type TEXT,
    	rating DOUBLE NOT NULL,
    	base_power DOUBLE NOT NULL,
    	balancing_id INTEGER NOT NULL,
    	PRIMARY KEY (id),
    	UNIQUE (name),
    	FOREIGN KEY(balancing_id) REFERENCES balancing_topology (id)
    )
    """,
    """
    CREATE TABLE supply_technology (
    	id INTEGER NOT NULL,
    	name TEXT NOT NULL,
    	obj_type TEXT NOT NULL,
    	prime_mover TEXT,
    	fuel_type TEXT,
    	area_id INTEGER,
    	balancing_id INTEGER,
    	PRIMARY KEY (id),
    	UNIQUE (name),
    	FOREIGN KEY(area_id) REFERENCES area (id),
    	FOREIGN KEY(balancing_id) REFERENCES balancing_topology (id)
    )
    """,
    """
    CREATE TABLE transmission (
    	id INTEGER NOT NULL,
    	name TEXT NOT NULL,
    	obj_type TEXT NOT NULL,
    	arc_id INTEGER NOT NULL,
    	rating DOUBLE NOT NULL,
    	PRIMARY KEY (id),
    	UNIQUE (name),
    	FOREIGN KEY(arc_id) REFERENCES arc (id)
    )
    """,
    """
    CREATE TABLE load (
    	id INTEGER NOT NULL,
    	name TEXT NOT NULL,
    	obj_type TEXT NOT NULL,
    	balancing_id INTEGER NOT NULL,
    	base_power DOUBLE NOT NULL,
    	PRIMARY KEY (id),
    	UNIQUE (name),
    	FOREIGN KEY(balancing_id) REFERENCES balancing_topology (id)
    )
    """,
]

const COLUMNS = Dict(
    "generation_unit" => [
        "id",
        "name",
        "obj_type",
        "balancing_id",
        "prime_mover",
        "fuel_type",
        "rating",
        "base_power",
    ],
    "area" => ["id", "name", "obj_type"],
    "attributes" => ["id", "entity_id", "entity_type", "key", "value"],
    "balancing_topology" => ["id", "name", "obj_type", "area_id"],
    "supply_technology" => [
        "id",
        "name",
        "obj_type",
        "prime_mover",
        "fuel_type",
        "area_id",
        "balancing_id",
    ],
    "transmission" => ["id", "name", "obj_type", "arc_id", "rating"],
    "arc" => ["id", "name", "obj_type", "from_id", "to_id"],
    "load" => ["id", "name", "obj_type", "balancing_id", "rating", "base_power"],
)

const OPENAPI_FIELDS_TO_DB = Dict(
    "arc" => "arc_id",
    "area" => "area_id",
    "bus" => "balancing_id",
    "prime_mover_type" => "prime_mover",
)

const DB_TO_OPENAPI_FIELDS = Dict(t => s for (s, t) in OPENAPI_FIELDS_TO_DB)

const ALL_PSY_TYPES = [
    PSY.ACBus,
    PSY.Arc,
    PSY.ThermalStandard,
    PSY.RenewableDispatch,
    PSY.Line,
    PSY.PowerLoad,
]
const ALL_TYPES =
    [ACBus, Arc, ThermalStandard, RenewableDispatch, Line, PowerLoad, StandardLoad]

const TYPE_NAMES = Dict(string(t) => t for t in ALL_TYPES)
const TYPE_TO_TABLE = Dict(
    ACBus => "balancing_topology",
    Arc => "arc",
    ThermalStandard => "generation_unit",
    RenewableDispatch => "generation_unit",
    Line => "transmission",
    PowerLoad => "load",
    StandardLoad => "load",
)

import SQLite
import DBInterface
import JSON

function make_sqlite!(db)
    for table in SQLITE_CREATE_STR
        DBInterface.execute(db, table)
    end
end

function load_to_db!(db, data::Arc)
    stmt_str = "INSERT INTO arc (id, from_id, to_id)
        VALUES (?, ?, ?)"
    DBInterface.execute(db, stmt_str, [data.id, data.from, data.to])
end

function load_to_db!(db, data)
    # Parse data to JSON
    T = typeof(data)
    table_name = TYPE_TO_TABLE[T]
    data = JSON.parse(OpenAPI.to_json(data))
    # Pack into main row
    main_row = Any[last(split(string(T), "."))]
    column_names = ["obj_type"]
    attributes = Dict()
    for (k, v) in data
        if haskey(OPENAPI_FIELDS_TO_DB, k)
            col_name = OPENAPI_FIELDS_TO_DB[k]
        else
            col_name = k
        end
        if in(col_name, COLUMNS[table_name])
            push!(column_names, col_name)
            push!(main_row, v)
        else
            attributes[k] = v
        end
    end
    println(column_names)
    println(main_row)
    println(attributes)
    stmt_str = "INSERT INTO $table_name ($(join(column_names, ", ")))
        VALUES ($(join(repeat("?", length(column_names)), ", ")))"
    println(stmt_str)
    DBInterface.execute(db, stmt_str, main_row)
    for (k, v) in attributes
        DBInterface.execute(
            db,
            "INSERT INTO attributes (entity_id, entity_type, key, value)
VALUES (?, ?, ?, jsonb(?))",
            [data["id"], "", k, JSON.json(v)],
        )
    end
end

function sys2db!(db, sys::PSY.System, ids::IDGenerator)
    for T in ALL_PSY_TYPES
        for c in PSY.get_components(T, sys)
            load_to_db!(db, psy2openapi(c, ids))
        end
    end
end
