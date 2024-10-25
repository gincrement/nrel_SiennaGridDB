# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""InputOutputCurve

    InputOutputCurve(;
        curve_type=nothing,
        function_data=nothing,
        input_at_zero=nothing,
    )

    - curve_type::String
    - function_data::InputOutputCurveFunctionData
    - input_at_zero::Float64
"""
Base.@kwdef mutable struct InputOutputCurve <: OpenAPI.APIModel
    curve_type::Union{Nothing, String} = nothing
    function_data = nothing # spec type: Union{ Nothing, InputOutputCurveFunctionData }
    input_at_zero::Union{Nothing, Float64} = nothing

    function InputOutputCurve(curve_type, function_data, input_at_zero, )
        OpenAPI.validate_property(InputOutputCurve, Symbol("curve_type"), curve_type)
        OpenAPI.validate_property(InputOutputCurve, Symbol("function_data"), function_data)
        OpenAPI.validate_property(InputOutputCurve, Symbol("input_at_zero"), input_at_zero)
        return new(curve_type, function_data, input_at_zero, )
    end
end # type InputOutputCurve

const _property_types_InputOutputCurve = Dict{Symbol,String}(Symbol("curve_type")=>"String", Symbol("function_data")=>"InputOutputCurveFunctionData", Symbol("input_at_zero")=>"Float64", )
OpenAPI.property_type(::Type{ InputOutputCurve }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_InputOutputCurve[name]))}

function check_required(o::InputOutputCurve)
    o.function_data === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ InputOutputCurve }, name::Symbol, val)
    if name === Symbol("curve_type")
        OpenAPI.validate_param(name, "InputOutputCurve", :enum, val, ["INPUT_OUTPUT"])
    end
end
