# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

@doc raw"""HydroEnergyReservoir

    HydroEnergyReservoir(;
        active_power=nothing,
        active_power_limits=nothing,
        available=nothing,
        base_power=nothing,
        bus=nothing,
        conversion_factor=1.0,
        id=nothing,
        inflow=nothing,
        initial_storage=nothing,
        name=nothing,
        operation_cost=nothing,
        prime_mover_type="OT",
        ramp_limits=nothing,
        rating=nothing,
        reactive_power=nothing,
        reactive_power_limits=nothing,
        status=false,
        storage_capacity=nothing,
        storage_target=1.0,
        time_at_status=10000.0,
        time_limits=nothing,
        dynamic_injector=nothing,
    )

    - active_power::Float64
    - active_power_limits::MinMax
    - available::Bool
    - base_power::Float64
    - bus::Int64
    - conversion_factor::Float64
    - id::Int64
    - inflow::Float64
    - initial_storage::Float64
    - name::String
    - operation_cost::HydroStorageGenerationCost
    - prime_mover_type::String
    - ramp_limits::UpDown
    - rating::Float64
    - reactive_power::Float64
    - reactive_power_limits::MinMax
    - status::Bool
    - storage_capacity::Float64
    - storage_target::Float64
    - time_at_status::Float64
    - time_limits::UpDown
    - dynamic_injector::Any
"""
Base.@kwdef mutable struct HydroEnergyReservoir <: OpenAPI.APIModel
    active_power::Union{Nothing, Float64} = nothing
    active_power_limits = nothing # spec type: Union{ Nothing, MinMax }
    available::Union{Nothing, Bool} = nothing
    base_power::Union{Nothing, Float64} = nothing
    bus::Union{Nothing, Int64} = nothing
    conversion_factor::Union{Nothing, Float64} = 1.0
    id::Union{Nothing, Int64} = nothing
    inflow::Union{Nothing, Float64} = nothing
    initial_storage::Union{Nothing, Float64} = nothing
    name::Union{Nothing, String} = nothing
    operation_cost = nothing # spec type: Union{ Nothing, HydroStorageGenerationCost }
    prime_mover_type::Union{Nothing, String} = "OT"
    ramp_limits = nothing # spec type: Union{ Nothing, UpDown }
    rating::Union{Nothing, Float64} = nothing
    reactive_power::Union{Nothing, Float64} = nothing
    reactive_power_limits = nothing # spec type: Union{ Nothing, MinMax }
    status::Union{Nothing, Bool} = false
    storage_capacity::Union{Nothing, Float64} = nothing
    storage_target::Union{Nothing, Float64} = 1.0
    time_at_status::Union{Nothing, Float64} = 10000.0
    time_limits = nothing # spec type: Union{ Nothing, UpDown }
    dynamic_injector::Union{Nothing, Any} = nothing

    function HydroEnergyReservoir(
        active_power,
        active_power_limits,
        available,
        base_power,
        bus,
        conversion_factor,
        id,
        inflow,
        initial_storage,
        name,
        operation_cost,
        prime_mover_type,
        ramp_limits,
        rating,
        reactive_power,
        reactive_power_limits,
        status,
        storage_capacity,
        storage_target,
        time_at_status,
        time_limits,
        dynamic_injector,
    )
        OpenAPI.validate_property(
            HydroEnergyReservoir,
            Symbol("active_power"),
            active_power,
        )
        OpenAPI.validate_property(
            HydroEnergyReservoir,
            Symbol("active_power_limits"),
            active_power_limits,
        )
        OpenAPI.validate_property(HydroEnergyReservoir, Symbol("available"), available)
        OpenAPI.validate_property(HydroEnergyReservoir, Symbol("base_power"), base_power)
        OpenAPI.validate_property(HydroEnergyReservoir, Symbol("bus"), bus)
        OpenAPI.validate_property(
            HydroEnergyReservoir,
            Symbol("conversion_factor"),
            conversion_factor,
        )
        OpenAPI.validate_property(HydroEnergyReservoir, Symbol("id"), id)
        OpenAPI.validate_property(HydroEnergyReservoir, Symbol("inflow"), inflow)
        OpenAPI.validate_property(
            HydroEnergyReservoir,
            Symbol("initial_storage"),
            initial_storage,
        )
        OpenAPI.validate_property(HydroEnergyReservoir, Symbol("name"), name)
        OpenAPI.validate_property(
            HydroEnergyReservoir,
            Symbol("operation_cost"),
            operation_cost,
        )
        OpenAPI.validate_property(
            HydroEnergyReservoir,
            Symbol("prime_mover_type"),
            prime_mover_type,
        )
        OpenAPI.validate_property(HydroEnergyReservoir, Symbol("ramp_limits"), ramp_limits)
        OpenAPI.validate_property(HydroEnergyReservoir, Symbol("rating"), rating)
        OpenAPI.validate_property(
            HydroEnergyReservoir,
            Symbol("reactive_power"),
            reactive_power,
        )
        OpenAPI.validate_property(
            HydroEnergyReservoir,
            Symbol("reactive_power_limits"),
            reactive_power_limits,
        )
        OpenAPI.validate_property(HydroEnergyReservoir, Symbol("status"), status)
        OpenAPI.validate_property(
            HydroEnergyReservoir,
            Symbol("storage_capacity"),
            storage_capacity,
        )
        OpenAPI.validate_property(
            HydroEnergyReservoir,
            Symbol("storage_target"),
            storage_target,
        )
        OpenAPI.validate_property(
            HydroEnergyReservoir,
            Symbol("time_at_status"),
            time_at_status,
        )
        OpenAPI.validate_property(HydroEnergyReservoir, Symbol("time_limits"), time_limits)
        OpenAPI.validate_property(
            HydroEnergyReservoir,
            Symbol("dynamic_injector"),
            dynamic_injector,
        )
        return new(
            active_power,
            active_power_limits,
            available,
            base_power,
            bus,
            conversion_factor,
            id,
            inflow,
            initial_storage,
            name,
            operation_cost,
            prime_mover_type,
            ramp_limits,
            rating,
            reactive_power,
            reactive_power_limits,
            status,
            storage_capacity,
            storage_target,
            time_at_status,
            time_limits,
            dynamic_injector,
        )
    end
end # type HydroEnergyReservoir

const _property_types_HydroEnergyReservoir = Dict{Symbol, String}(
    Symbol("active_power") => "Float64",
    Symbol("active_power_limits") => "MinMax",
    Symbol("available") => "Bool",
    Symbol("base_power") => "Float64",
    Symbol("bus") => "Int64",
    Symbol("conversion_factor") => "Float64",
    Symbol("id") => "Int64",
    Symbol("inflow") => "Float64",
    Symbol("initial_storage") => "Float64",
    Symbol("name") => "String",
    Symbol("operation_cost") => "HydroStorageGenerationCost",
    Symbol("prime_mover_type") => "String",
    Symbol("ramp_limits") => "UpDown",
    Symbol("rating") => "Float64",
    Symbol("reactive_power") => "Float64",
    Symbol("reactive_power_limits") => "MinMax",
    Symbol("status") => "Bool",
    Symbol("storage_capacity") => "Float64",
    Symbol("storage_target") => "Float64",
    Symbol("time_at_status") => "Float64",
    Symbol("time_limits") => "UpDown",
    Symbol("dynamic_injector") => "Any",
)
OpenAPI.property_type(::Type{HydroEnergyReservoir}, name::Symbol) =
    Union{Nothing, eval(Base.Meta.parse(_property_types_HydroEnergyReservoir[name]))}

function check_required(o::HydroEnergyReservoir)
    o.active_power === nothing && (return false)
    o.active_power_limits === nothing && (return false)
    o.available === nothing && (return false)
    o.base_power === nothing && (return false)
    o.bus === nothing && (return false)
    o.id === nothing && (return false)
    o.inflow === nothing && (return false)
    o.initial_storage === nothing && (return false)
    o.name === nothing && (return false)
    o.prime_mover_type === nothing && (return false)
    o.rating === nothing && (return false)
    o.reactive_power === nothing && (return false)
    o.storage_capacity === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{HydroEnergyReservoir}, name::Symbol, val)
    if name === Symbol("prime_mover_type")
        OpenAPI.validate_param(
            name,
            "HydroEnergyReservoir",
            :enum,
            val,
            [
                "BA",
                "BT",
                "CA",
                "CC",
                "CE",
                "CP",
                "CS",
                "CT",
                "ES",
                "FC",
                "FW",
                "GT",
                "HA",
                "HB",
                "HK",
                "HY",
                "IC",
                "PS",
                "OT",
                "ST",
                "PVe",
                "WT",
                "WS",
            ],
        )
    end
end
