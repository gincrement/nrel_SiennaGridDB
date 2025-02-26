# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""ThermalStandard

    ThermalStandard(;
        active_power=nothing,
        active_power_limits=nothing,
        available=nothing,
        base_power=0.0,
        bus=nothing,
        fuel_type="OTHER",
        id=nothing,
        must_run=false,
        name=nothing,
        operation_cost=nothing,
        prime_mover="OT",
        ramp_limits=nothing,
        rating=nothing,
        reactive_power=nothing,
        reactive_power_limits=nothing,
        status=nothing,
        time_at_status=10000.0,
        time_limits=nothing,
        dynamic_injector=nothing,
    )

    - active_power::Float64
    - active_power_limits::MinMax
    - available::Bool
    - base_power::Float64
    - bus::Int64
    - fuel_type::String : Thermal fuels that reflect options in the EIA annual energy review.
    - id::Int64
    - must_run::Bool
    - name::String
    - operation_cost::ThermalGenerationCost
    - prime_mover::String
    - ramp_limits::UpDown
    - rating::Float64
    - reactive_power::Float64
    - reactive_power_limits::MinMax
    - status::Bool
    - time_at_status::Float64
    - time_limits::UpDown
    - dynamic_injector::Any
"""
Base.@kwdef mutable struct ThermalStandard <: OpenAPI.APIModel
    active_power::Union{Nothing, Float64} = nothing
    active_power_limits = nothing # spec type: Union{ Nothing, MinMax }
    available::Union{Nothing, Bool} = nothing
    base_power::Union{Nothing, Float64} = 0.0
    bus::Union{Nothing, Int64} = nothing
    fuel_type::Union{Nothing, String} = "OTHER"
    id::Union{Nothing, Int64} = nothing
    must_run::Union{Nothing, Bool} = false
    name::Union{Nothing, String} = nothing
    operation_cost = nothing # spec type: Union{ Nothing, ThermalGenerationCost }
    prime_mover::Union{Nothing, String} = "OT"
    ramp_limits = nothing # spec type: Union{ Nothing, UpDown }
    rating::Union{Nothing, Float64} = nothing
    reactive_power::Union{Nothing, Float64} = nothing
    reactive_power_limits = nothing # spec type: Union{ Nothing, MinMax }
    status::Union{Nothing, Bool} = nothing
    time_at_status::Union{Nothing, Float64} = 10000.0
    time_limits = nothing # spec type: Union{ Nothing, UpDown }
    dynamic_injector::Union{Nothing, Any} = nothing

    function ThermalStandard(active_power, active_power_limits, available, base_power, bus, fuel_type, id, must_run, name, operation_cost, prime_mover, ramp_limits, rating, reactive_power, reactive_power_limits, status, time_at_status, time_limits, dynamic_injector, )
        OpenAPI.validate_property(ThermalStandard, Symbol("active_power"), active_power)
        OpenAPI.validate_property(ThermalStandard, Symbol("active_power_limits"), active_power_limits)
        OpenAPI.validate_property(ThermalStandard, Symbol("available"), available)
        OpenAPI.validate_property(ThermalStandard, Symbol("base_power"), base_power)
        OpenAPI.validate_property(ThermalStandard, Symbol("bus"), bus)
        OpenAPI.validate_property(ThermalStandard, Symbol("fuel_type"), fuel_type)
        OpenAPI.validate_property(ThermalStandard, Symbol("id"), id)
        OpenAPI.validate_property(ThermalStandard, Symbol("must_run"), must_run)
        OpenAPI.validate_property(ThermalStandard, Symbol("name"), name)
        OpenAPI.validate_property(ThermalStandard, Symbol("operation_cost"), operation_cost)
        OpenAPI.validate_property(ThermalStandard, Symbol("prime_mover"), prime_mover)
        OpenAPI.validate_property(ThermalStandard, Symbol("ramp_limits"), ramp_limits)
        OpenAPI.validate_property(ThermalStandard, Symbol("rating"), rating)
        OpenAPI.validate_property(ThermalStandard, Symbol("reactive_power"), reactive_power)
        OpenAPI.validate_property(ThermalStandard, Symbol("reactive_power_limits"), reactive_power_limits)
        OpenAPI.validate_property(ThermalStandard, Symbol("status"), status)
        OpenAPI.validate_property(ThermalStandard, Symbol("time_at_status"), time_at_status)
        OpenAPI.validate_property(ThermalStandard, Symbol("time_limits"), time_limits)
        OpenAPI.validate_property(ThermalStandard, Symbol("dynamic_injector"), dynamic_injector)
        return new(active_power, active_power_limits, available, base_power, bus, fuel_type, id, must_run, name, operation_cost, prime_mover, ramp_limits, rating, reactive_power, reactive_power_limits, status, time_at_status, time_limits, dynamic_injector, )
    end
end # type ThermalStandard

const _property_types_ThermalStandard = Dict{Symbol,String}(Symbol("active_power")=>"Float64", Symbol("active_power_limits")=>"MinMax", Symbol("available")=>"Bool", Symbol("base_power")=>"Float64", Symbol("bus")=>"Int64", Symbol("fuel_type")=>"String", Symbol("id")=>"Int64", Symbol("must_run")=>"Bool", Symbol("name")=>"String", Symbol("operation_cost")=>"ThermalGenerationCost", Symbol("prime_mover")=>"String", Symbol("ramp_limits")=>"UpDown", Symbol("rating")=>"Float64", Symbol("reactive_power")=>"Float64", Symbol("reactive_power_limits")=>"MinMax", Symbol("status")=>"Bool", Symbol("time_at_status")=>"Float64", Symbol("time_limits")=>"UpDown", Symbol("dynamic_injector")=>"Any", )
OpenAPI.property_type(::Type{ ThermalStandard }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_ThermalStandard[name]))}

function check_required(o::ThermalStandard)
    o.active_power === nothing && (return false)
    o.active_power_limits === nothing && (return false)
    o.available === nothing && (return false)
    o.base_power === nothing && (return false)
    o.bus === nothing && (return false)
    o.id === nothing && (return false)
    o.name === nothing && (return false)
    o.operation_cost === nothing && (return false)
    o.rating === nothing && (return false)
    o.reactive_power === nothing && (return false)
    o.status === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ ThermalStandard }, name::Symbol, val)






    if name === Symbol("fuel_type")
        OpenAPI.validate_param(name, "ThermalStandard", :enum, val, ["COAL", "WASTE_COAL", "DISTILLATE_FUEL_OIL", "WASTE_OIL", "PETROLEUM_COKE", "RESIDUAL_FUEL_OIL", "NATURAL_GAS", "OTHER_GAS", "NUCLEAR", "AG_BIPRODUCT", "MUNICIPAL_WASTE", "WOOD_WASTE", "GEOTHERMAL", "OTHER"])
    end






    if name === Symbol("prime_mover")
        OpenAPI.validate_param(name, "ThermalStandard", :enum, val, ["BA", "BT", "CA", "CC", "CE", "CP", "CS", "CT", "ES", "FC", "FW", "GT", "HA", "HB", "HK", "HY", "IC", "PS", "OT", "ST", "PVe", "WT", "WS"])
    end









end
