using SiennaOpenAPIModels
using PowerSystemCaseBuilder
import PowerSystems
const PSY = PowerSystems
using JSON
import SQLite
import DBInterface
import Tables

function attributes_to_dict(column_table)
    d = Dict()
    for row in Tables.rows(column_table)
        d[row.key] = JSON.parse(row.value)
    end
    return d
end

custom_isequivalent(x, y) = isequal(x, y) || (x == y)
custom_isequivalent(x::AbstractFloat, y::AbstractFloat) = isequal(x, y) || (x == y) || x ≈ y

function test_component_each_type(sys, copy_of_sys)
    for T in SiennaOpenAPIModels.ALL_DESERIALIZABLE_TYPES
        SIENNA_T = SiennaOpenAPIModels.OPENAPI_TYPE_TO_PSY[T]
        @test length(PSY.get_components(SIENNA_T, sys)) ==
              length(PSY.get_components(SIENNA_T, copy_of_sys))
        if SIENNA_T <: PSY.Arc
            continue
        end
        if isempty(PSY.get_components(SIENNA_T, sys))
            continue
        end
        component = first(PSY.get_components(SIENNA_T, sys))
        new_component = PSY.get_component(SIENNA_T, copy_of_sys, component.name)
        @test IS.compare_values(
            custom_isequivalent,
            component,
            new_component,
            exclude=Set([:internal, :services]),
        )
    end

    arcs = [c.from.name => c.to.name for c in PSY.get_components(PSY.Arc, sys)]
    arcs_copy = [c.from.name => c.to.name for c in PSY.get_components(PSY.Arc, copy_of_sys)]
    @test sort(arcs) == sort(arcs_copy)
end

@testset "c_sys5_pjm to DB" begin
    c_sys5 =
        PowerSystemCaseBuilder.build_system(PowerSystemCaseBuilder.PSISystems, "c_sys5_pjm")
    @testset "ACBus to DB" begin
        acbus = PSY.get_bus(c_sys5, 1)
        db = SQLite.DB()
        SiennaOpenAPIModels.make_sqlite!(db)
        @test collect(DBInterface.execute(db, "SELECT * FROM bus")) == []
        SiennaOpenAPIModels.send_table_to_db!(
            SiennaOpenAPIModels.ACBus,
            db,
            [acbus],
            IDGenerator(),
        )

        rows = Tables.rowtable(DBInterface.execute(db, "SELECT * FROM bus"))
        @test length(rows) == 1
        @test isequal(
            first(rows),
            (id=1, name="nodeA", obj_type="ACBus", area_id=missing, loadzone_id=missing),
        )
        attributes = Tables.columntable(
            DBInterface.execute(
                db,
                "SELECT id, entity_id, entity_type, key, json(value) as value FROM attributes",
            ),
        )
        @test length(attributes.id) == 6
        @test length(unique(attributes.id)) == 6
        @test all(attributes.entity_id .== 1)
        @test all(attributes.entity_type .== "bus")
        @test attributes_to_dict(attributes) == Dict(
            "voltage_limits" => Dict{String, Any}("max" => 1.05, "min" => 0.9),
            "base_voltage" => 230.0,
            "number" => 1,
            "magnitude" => 1.0,
            "angle" => 0.0,
            "bustype" => "PV",
        )
    end
    @testset "Full sys to DB" begin
        db = SQLite.DB()
        SiennaOpenAPIModels.make_sqlite!(db)
        SiennaOpenAPIModels.sys2db!(db, c_sys5, IDGenerator())
        acbuses = Tables.columntable(DBInterface.execute(db, "SELECT * FROM bus"))
        @test sort(acbuses.id) == [1, 2, 3, 4, 5]
        loads = Tables.columntable(DBInterface.execute(db, "SELECT * FROM load"))
        @test length(loads.id) == 3
        @test length(unique(loads.id)) == 3
        loads_attribute = Tables.columntable(
            DBInterface.execute(db, "SELECT * FROM attributes where entity_id=1"),
        )
        @test all(loads_attribute.entity_type .== "bus")
    end

    @testset "Sys to DB" begin
        db = SQLite.DB()
        SiennaOpenAPIModels.make_sqlite!(db)
        id_generator = IDGenerator()
        SiennaOpenAPIModels.sys2db!(db, c_sys5, id_generator)
        copy_of_sys = SiennaOpenAPIModels.make_system_from_db(db)
        @test copy_of_sys isa PSY.System
        for T in SiennaOpenAPIModels.ALL_DESERIALIZABLE_TYPES
            SIENNA_T = SiennaOpenAPIModels.OPENAPI_TYPE_TO_PSY[T]
            @test length(PSY.get_components(SIENNA_T, c_sys5)) ==
                  length(PSY.get_components(SIENNA_T, copy_of_sys))
            if SIENNA_T <: PSY.Arc
                continue
            end
            for component in PSY.get_components(SIENNA_T, c_sys5)
                new_component = PSY.get_component(SIENNA_T, copy_of_sys, component.name)
                @test IS.compare_values(
                    custom_isequivalent,
                    component,
                    new_component,
                    exclude=Set([:internal]),
                )
            end
        end
    end
end

@testset "118_bus to DB" begin
    # Get 118_bus_rt.json from directory of this file
    sys = PSY.System(joinpath(dirname(@__FILE__), "118_bus.json"))
    db = SQLite.DB()
    SiennaOpenAPIModels.make_sqlite!(db)
    SiennaOpenAPIModels.sys2db!(db, sys, IDGenerator())
    acbuses = Tables.columntable(DBInterface.execute(db, "SELECT * FROM bus"))
    @test length(acbuses.id) == 118

    copy_of_sys = SiennaOpenAPIModels.make_system_from_db(db)
    @test copy_of_sys isa PSY.System
    test_component_each_type(sys, copy_of_sys)
end

@testset "RTS-System to DB" begin
    sys = PowerSystemCaseBuilder.build_system(
        PowerSystemCaseBuilder.PSISystems,
        "RTS_GMLC_RT_sys",
    )
    for fixed_admittance in PSY.get_components(PSY.FixedAdmittance, sys)
        PSY.set_name!(sys, fixed_admittance, PSY.get_name(fixed_admittance) * "_admitatnce")
    end
    for thermal_standard in
        PSY.get_components(x -> x.base_power == 0.0, PSY.ThermalStandard, sys)
        PSY.set_base_power!(thermal_standard, 0.001)
    end
    db = SQLite.DB()
    SiennaOpenAPIModels.make_sqlite!(db)
    SiennaOpenAPIModels.sys2db!(db, sys, IDGenerator())
    acbuses = Tables.columntable(DBInterface.execute(db, "SELECT * FROM bus"))
    @test length(acbuses.id) == 73

    copy_of_sys = SiennaOpenAPIModels.make_system_from_db(db)
    @test copy_of_sys isa PSY.System
    test_component_each_type(sys, copy_of_sys)
end
