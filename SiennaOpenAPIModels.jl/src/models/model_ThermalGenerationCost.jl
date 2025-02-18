# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

@doc raw"""ThermalGenerationCost
Cost representation for thermal generation units

    ThermalGenerationCost(;
        cost_type="THERMAL",
        fixed=nothing,
        shut_down=nothing,
        start_up=nothing,
        variable=nothing,
    )

    - cost_type::String
    - fixed::Float64 : Fixed cost of keeping the unit online. For some cost represenations this field can be duplicative
    - shut_down::Float64 : Cost to turn the unit off
    - start_up::ThermalGenerationCostStartUp
    - variable::ProductionVariableCostCurve
"""
Base.@kwdef mutable struct ThermalGenerationCost <: OpenAPI.APIModel
    cost_type::Union{Nothing, String} = "THERMAL"
    fixed::Union{Nothing, Float64} = nothing
    shut_down::Union{Nothing, Float64} = nothing
    start_up = nothing # spec type: Union{ Nothing, ThermalGenerationCostStartUp }
    variable = nothing # spec type: Union{ Nothing, ProductionVariableCostCurve }

    function ThermalGenerationCost(cost_type, fixed, shut_down, start_up, variable)
        OpenAPI.validate_property(ThermalGenerationCost, Symbol("cost_type"), cost_type)
        OpenAPI.validate_property(ThermalGenerationCost, Symbol("fixed"), fixed)
        OpenAPI.validate_property(ThermalGenerationCost, Symbol("shut_down"), shut_down)
        OpenAPI.validate_property(ThermalGenerationCost, Symbol("start_up"), start_up)
        OpenAPI.validate_property(ThermalGenerationCost, Symbol("variable"), variable)
        return new(cost_type, fixed, shut_down, start_up, variable)
    end
end # type ThermalGenerationCost

const _property_types_ThermalGenerationCost = Dict{Symbol, String}(
    Symbol("cost_type") => "String",
    Symbol("fixed") => "Float64",
    Symbol("shut_down") => "Float64",
    Symbol("start_up") => "ThermalGenerationCostStartUp",
    Symbol("variable") => "ProductionVariableCostCurve",
)
OpenAPI.property_type(::Type{ThermalGenerationCost}, name::Symbol) =
    Union{Nothing, eval(Base.Meta.parse(_property_types_ThermalGenerationCost[name]))}

function check_required(o::ThermalGenerationCost)
    o.fixed === nothing && (return false)
    o.shut_down === nothing && (return false)
    o.start_up === nothing && (return false)
    o.variable === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ThermalGenerationCost}, name::Symbol, val)
    if name === Symbol("cost_type")
        OpenAPI.validate_param(name, "ThermalGenerationCost", :enum, val, ["THERMAL"])
    end
end
