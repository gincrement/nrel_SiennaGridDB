# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.



@doc raw"""TwoTerminalHVDCLine_loss

    TwoTerminalHVDCLineLoss(; value=nothing)
"""
mutable struct TwoTerminalHVDCLineLoss <: OpenAPI.OneOfAPIModel
    value::Any # Union{ IncrementalCurve, InputOutputCurve }
    TwoTerminalHVDCLineLoss() = new()
    TwoTerminalHVDCLineLoss(value) = new(value)
end # type TwoTerminalHVDCLineLoss

function OpenAPI.property_type(::Type{ TwoTerminalHVDCLineLoss }, name::Symbol, json::Dict{String,Any})
    discriminator = json["curve_type"]
    if discriminator == "INCREMENTAL"
        return eval(Base.Meta.parse("ERRORUNKNOWN"))
    elseif discriminator == "INPUT_OUTPUT"
        return eval(Base.Meta.parse("ERRORUNKNOWN"))
    end
    throw(OpenAPI.ValidationException("Invalid discriminator value: $discriminator for TwoTerminalHVDCLineLoss"))
end
