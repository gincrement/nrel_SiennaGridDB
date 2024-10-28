# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""FuelCurve

    FuelCurve(;
        fuel_cost=nothing,
        power_units=nothing,
        value_curve=nothing,
        variable_cost_type=nothing,
        vom_cost=nothing,
    )

    - fuel_cost::FuelCurveFuelCost
    - power_units::String
    - value_curve::CostCurveValueCurve
    - variable_cost_type::String
    - vom_cost::InputOutputCurve
"""
Base.@kwdef mutable struct FuelCurve <: OpenAPI.APIModel
    fuel_cost = nothing # spec type: Union{ Nothing, FuelCurveFuelCost }
    power_units::Union{Nothing,String} = nothing
    value_curve = nothing # spec type: Union{ Nothing, CostCurveValueCurve }
    variable_cost_type::Union{Nothing,String} = nothing
    vom_cost = nothing # spec type: Union{ Nothing, InputOutputCurve }

    function FuelCurve(fuel_cost, power_units, value_curve, variable_cost_type, vom_cost)
        OpenAPI.validate_property(FuelCurve, Symbol("fuel_cost"), fuel_cost)
        OpenAPI.validate_property(FuelCurve, Symbol("power_units"), power_units)
        OpenAPI.validate_property(FuelCurve, Symbol("value_curve"), value_curve)
        OpenAPI.validate_property(
            FuelCurve,
            Symbol("variable_cost_type"),
            variable_cost_type,
        )
        OpenAPI.validate_property(FuelCurve, Symbol("vom_cost"), vom_cost)
        return new(fuel_cost, power_units, value_curve, variable_cost_type, vom_cost)
    end
end # type FuelCurve

const _property_types_FuelCurve = Dict{Symbol,String}(
    Symbol("fuel_cost") => "FuelCurveFuelCost",
    Symbol("power_units") => "String",
    Symbol("value_curve") => "CostCurveValueCurve",
    Symbol("variable_cost_type") => "String",
    Symbol("vom_cost") => "InputOutputCurve",
)
OpenAPI.property_type(::Type{FuelCurve}, name::Symbol) =
    Union{Nothing,eval(Base.Meta.parse(_property_types_FuelCurve[name]))}

function check_required(o::FuelCurve)
    o.fuel_cost === nothing && (return false)
    o.power_units === nothing && (return false)
    o.value_curve === nothing && (return false)
    o.vom_cost === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{FuelCurve}, name::Symbol, val)
    if name === Symbol("power_units")
        OpenAPI.validate_param(
            name,
            "FuelCurve",
            :enum,
            val,
            ["SYSTEM_BASE", "DEVICE_BASE", "NATURAL_UNITS"],
        )
    end
    if name === Symbol("variable_cost_type")
        OpenAPI.validate_param(name, "FuelCurve", :enum, val, ["FUEL"])
    end
end
