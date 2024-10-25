# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""ThermalStandard

    ThermalStandard(;
        id=nothing,
        name=nothing,
        prime_mover="OT",
        fuel_type="OTHER",
        rating=0.0,
        base_power=0.0,
        available=true,
        status=true,
        active_power=0.0,
        reactive_power=0.0,
        active_power_limits=nothing,
        reactive_power_limits=nothing,
        ramp_limits=nothing,
        operation_cost=nothing,
        time_limits=nothing,
        must_run=false,
        bus_id=nothing,
    )

    - id::Int64
    - name::String
    - prime_mover::String
    - fuel_type::String : Thermal fuels that reflect options in the EIA annual energy review.
    - rating::Float64
    - base_power::Float64
    - available::Bool
    - status::Bool
    - active_power::Float64
    - reactive_power::Float64
    - active_power_limits::MinMax
    - reactive_power_limits::MinMax
    - ramp_limits::UpDown
    - operation_cost::ThermalStandardOperationCost
    - time_limits::UpDown
    - must_run::Bool
    - bus_id::Int64
"""
Base.@kwdef mutable struct ThermalStandard <: OpenAPI.APIModel
    id::Union{Nothing, Int64} = nothing
    name::Union{Nothing, String} = nothing
    prime_mover::Union{Nothing, String} = "OT"
    fuel_type::Union{Nothing, String} = "OTHER"
    rating::Union{Nothing, Float64} = 0.0
    base_power::Union{Nothing, Float64} = 0.0
    available::Union{Nothing, Bool} = true
    status::Union{Nothing, Bool} = true
    active_power::Union{Nothing, Float64} = 0.0
    reactive_power::Union{Nothing, Float64} = 0.0
    active_power_limits = nothing # spec type: Union{ Nothing, MinMax }
    reactive_power_limits = nothing # spec type: Union{ Nothing, MinMax }
    ramp_limits = nothing # spec type: Union{ Nothing, UpDown }
    operation_cost = nothing # spec type: Union{ Nothing, ThermalStandardOperationCost }
    time_limits = nothing # spec type: Union{ Nothing, UpDown }
    must_run::Union{Nothing, Bool} = false
    bus_id::Union{Nothing, Int64} = nothing

    function ThermalStandard(id, name, prime_mover, fuel_type, rating, base_power, available, status, active_power, reactive_power, active_power_limits, reactive_power_limits, ramp_limits, operation_cost, time_limits, must_run, bus_id, )
        OpenAPI.validate_property(ThermalStandard, Symbol("id"), id)
        OpenAPI.validate_property(ThermalStandard, Symbol("name"), name)
        OpenAPI.validate_property(ThermalStandard, Symbol("prime_mover"), prime_mover)
        OpenAPI.validate_property(ThermalStandard, Symbol("fuel_type"), fuel_type)
        OpenAPI.validate_property(ThermalStandard, Symbol("rating"), rating)
        OpenAPI.validate_property(ThermalStandard, Symbol("base_power"), base_power)
        OpenAPI.validate_property(ThermalStandard, Symbol("available"), available)
        OpenAPI.validate_property(ThermalStandard, Symbol("status"), status)
        OpenAPI.validate_property(ThermalStandard, Symbol("active_power"), active_power)
        OpenAPI.validate_property(ThermalStandard, Symbol("reactive_power"), reactive_power)
        OpenAPI.validate_property(ThermalStandard, Symbol("active_power_limits"), active_power_limits)
        OpenAPI.validate_property(ThermalStandard, Symbol("reactive_power_limits"), reactive_power_limits)
        OpenAPI.validate_property(ThermalStandard, Symbol("ramp_limits"), ramp_limits)
        OpenAPI.validate_property(ThermalStandard, Symbol("operation_cost"), operation_cost)
        OpenAPI.validate_property(ThermalStandard, Symbol("time_limits"), time_limits)
        OpenAPI.validate_property(ThermalStandard, Symbol("must_run"), must_run)
        OpenAPI.validate_property(ThermalStandard, Symbol("bus_id"), bus_id)
        return new(id, name, prime_mover, fuel_type, rating, base_power, available, status, active_power, reactive_power, active_power_limits, reactive_power_limits, ramp_limits, operation_cost, time_limits, must_run, bus_id, )
    end
end # type ThermalStandard

const _property_types_ThermalStandard = Dict{Symbol,String}(Symbol("id")=>"Int64", Symbol("name")=>"String", Symbol("prime_mover")=>"String", Symbol("fuel_type")=>"String", Symbol("rating")=>"Float64", Symbol("base_power")=>"Float64", Symbol("available")=>"Bool", Symbol("status")=>"Bool", Symbol("active_power")=>"Float64", Symbol("reactive_power")=>"Float64", Symbol("active_power_limits")=>"MinMax", Symbol("reactive_power_limits")=>"MinMax", Symbol("ramp_limits")=>"UpDown", Symbol("operation_cost")=>"ThermalStandardOperationCost", Symbol("time_limits")=>"UpDown", Symbol("must_run")=>"Bool", Symbol("bus_id")=>"Int64", )
OpenAPI.property_type(::Type{ ThermalStandard }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_ThermalStandard[name]))}

function check_required(o::ThermalStandard)
    o.id === nothing && (return false)
    o.name === nothing && (return false)
    o.operation_cost === nothing && (return false)
    o.bus_id === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ ThermalStandard }, name::Symbol, val)
    if name === Symbol("prime_mover")
        OpenAPI.validate_param(name, "ThermalStandard", :enum, val, ["BA", "BT", "CA", "CC", "CE", "CP", "CS", "CT", "ES", "FC", "FW", "GT", "HA", "HB", "HK", "HY", "IC", "PS", "OT", "ST", "PVe", "WT", "WS"])
    end
    if name === Symbol("fuel_type")
        OpenAPI.validate_param(name, "ThermalStandard", :enum, val, ["COAL", "WASTE_COAL", "DISTILLATE_FUEL_OIL", "WASTE_OIL", "PETROLEUM_COKE", "RESIDUAL_FUEL_OIL", "NATURAL_GAS", "OTHER_GAS", "NUCLEAR", "AG_BIPRODUCT", "MUNICIPAL_WASTE", "WOOD_WASTE", "GEOTHERMAL", "OTHER"])
    end
end
