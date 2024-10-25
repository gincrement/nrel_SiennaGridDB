# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.



@doc raw"""IncrementalCurve_function_data

    IncrementalCurveFunctionData(; value=nothing)
"""
mutable struct IncrementalCurveFunctionData <: OpenAPI.OneOfAPIModel
    value::Any # Union{ LinearFunctionData, PiecewiseStepData }
    IncrementalCurveFunctionData() = new()
    IncrementalCurveFunctionData(value) = new(value)
end # type IncrementalCurveFunctionData

function OpenAPI.property_type(::Type{ IncrementalCurveFunctionData }, name::Symbol, json::Dict{String,Any})
    
    # no discriminator specified, can't determine the exact type
    return fieldtype(IncrementalCurveFunctionData, name)
end
