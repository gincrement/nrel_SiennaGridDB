# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""IncrementalCurve

    IncrementalCurve(;
        curve_type=nothing,
        function_data=nothing,
        initial_input=nothing,
        input_at_zero=nothing,
    )

    - curve_type::String
    - function_data::IncrementalCurveFunctionData
    - initial_input::Float64
    - input_at_zero::Float64
"""
Base.@kwdef mutable struct IncrementalCurve <: OpenAPI.APIModel
    curve_type::Union{Nothing, String} = nothing
    function_data = nothing # spec type: Union{ Nothing, IncrementalCurveFunctionData }
    initial_input::Union{Nothing, Float64} = nothing
    input_at_zero::Union{Nothing, Float64} = nothing

    function IncrementalCurve(curve_type, function_data, initial_input, input_at_zero, )
        OpenAPI.validate_property(IncrementalCurve, Symbol("curve_type"), curve_type)
        OpenAPI.validate_property(IncrementalCurve, Symbol("function_data"), function_data)
        OpenAPI.validate_property(IncrementalCurve, Symbol("initial_input"), initial_input)
        OpenAPI.validate_property(IncrementalCurve, Symbol("input_at_zero"), input_at_zero)
        return new(curve_type, function_data, initial_input, input_at_zero, )
    end
end # type IncrementalCurve

const _property_types_IncrementalCurve = Dict{Symbol,String}(Symbol("curve_type")=>"String", Symbol("function_data")=>"IncrementalCurveFunctionData", Symbol("initial_input")=>"Float64", Symbol("input_at_zero")=>"Float64", )
OpenAPI.property_type(::Type{ IncrementalCurve }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_IncrementalCurve[name]))}

function check_required(o::IncrementalCurve)
    o.function_data === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ IncrementalCurve }, name::Symbol, val)
    if name === Symbol("curve_type")
        OpenAPI.validate_param(name, "IncrementalCurve", :enum, val, ["INCREMENTAL"])
    end
end
