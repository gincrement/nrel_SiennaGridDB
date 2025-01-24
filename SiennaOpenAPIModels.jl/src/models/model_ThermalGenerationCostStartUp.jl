# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.



@doc raw"""ThermalGenerationCost_start_up
Start-up cost can take linear or multi-stage cost

    ThermalGenerationCostStartUp(; value=nothing)
"""
mutable struct ThermalGenerationCostStartUp <: OpenAPI.OneOfAPIModel
    value::Any # Union{ Float64, StartUpStages }
    ThermalGenerationCostStartUp() = new()
    ThermalGenerationCostStartUp(value) = new(value)
end # type ThermalGenerationCostStartUp

function OpenAPI.property_type(
    ::Type{ThermalGenerationCostStartUp},
    name::Symbol,
    json::Dict{String,Any},
)

    # no discriminator specified, can't determine the exact type
    return fieldtype(ThermalGenerationCostStartUp, name)
end
