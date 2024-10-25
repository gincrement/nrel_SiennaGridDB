# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.



@doc raw"""ThermalStandard_operation_cost_start_up
Start-up cost can take linear or multi-stage cost

    ThermalStandardOperationCostStartUp(; value=nothing)
"""
mutable struct ThermalStandardOperationCostStartUp <: OpenAPI.OneOfAPIModel
    value::Any # Union{ Float64, StartUpStages }
    ThermalStandardOperationCostStartUp() = new()
    ThermalStandardOperationCostStartUp(value) = new(value)
end # type ThermalStandardOperationCostStartUp

function OpenAPI.property_type(::Type{ ThermalStandardOperationCostStartUp }, name::Symbol, json::Dict{String,Any})
    
    # no discriminator specified, can't determine the exact type
    return fieldtype(ThermalStandardOperationCostStartUp, name)
end
