# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

@doc raw"""VariableReserveNonSpinning

    VariableReserveNonSpinning(;
        available=nothing,
        deployed_fraction=0.0,
        id=nothing,
        max_output_fraction=1.0,
        max_participation_factor=1.0,
        name=nothing,
        requirement=nothing,
        sustained_time=14400.0,
        time_frame=nothing,
    )

    - available::Bool
    - deployed_fraction::Float64
    - id::Int64
    - max_output_fraction::Float64
    - max_participation_factor::Float64
    - name::String
    - requirement::Float64
    - sustained_time::Float64
    - time_frame::Float64
"""
Base.@kwdef mutable struct VariableReserveNonSpinning <: OpenAPI.APIModel
    available::Union{Nothing, Bool} = nothing
    deployed_fraction::Union{Nothing, Float64} = 0.0
    id::Union{Nothing, Int64} = nothing
    max_output_fraction::Union{Nothing, Float64} = 1.0
    max_participation_factor::Union{Nothing, Float64} = 1.0
    name::Union{Nothing, String} = nothing
    requirement::Union{Nothing, Float64} = nothing
    sustained_time::Union{Nothing, Float64} = 14400.0
    time_frame::Union{Nothing, Float64} = nothing

    function VariableReserveNonSpinning(
        available,
        deployed_fraction,
        id,
        max_output_fraction,
        max_participation_factor,
        name,
        requirement,
        sustained_time,
        time_frame,
    )
        OpenAPI.validate_property(
            VariableReserveNonSpinning,
            Symbol("available"),
            available,
        )
        OpenAPI.validate_property(
            VariableReserveNonSpinning,
            Symbol("deployed_fraction"),
            deployed_fraction,
        )
        OpenAPI.validate_property(VariableReserveNonSpinning, Symbol("id"), id)
        OpenAPI.validate_property(
            VariableReserveNonSpinning,
            Symbol("max_output_fraction"),
            max_output_fraction,
        )
        OpenAPI.validate_property(
            VariableReserveNonSpinning,
            Symbol("max_participation_factor"),
            max_participation_factor,
        )
        OpenAPI.validate_property(VariableReserveNonSpinning, Symbol("name"), name)
        OpenAPI.validate_property(
            VariableReserveNonSpinning,
            Symbol("requirement"),
            requirement,
        )
        OpenAPI.validate_property(
            VariableReserveNonSpinning,
            Symbol("sustained_time"),
            sustained_time,
        )
        OpenAPI.validate_property(
            VariableReserveNonSpinning,
            Symbol("time_frame"),
            time_frame,
        )
        return new(
            available,
            deployed_fraction,
            id,
            max_output_fraction,
            max_participation_factor,
            name,
            requirement,
            sustained_time,
            time_frame,
        )
    end
end # type VariableReserveNonSpinning

const _property_types_VariableReserveNonSpinning = Dict{Symbol, String}(
    Symbol("available") => "Bool",
    Symbol("deployed_fraction") => "Float64",
    Symbol("id") => "Int64",
    Symbol("max_output_fraction") => "Float64",
    Symbol("max_participation_factor") => "Float64",
    Symbol("name") => "String",
    Symbol("requirement") => "Float64",
    Symbol("sustained_time") => "Float64",
    Symbol("time_frame") => "Float64",
)
OpenAPI.property_type(::Type{VariableReserveNonSpinning}, name::Symbol) =
    Union{Nothing, eval(Base.Meta.parse(_property_types_VariableReserveNonSpinning[name]))}

function check_required(o::VariableReserveNonSpinning)
    o.available === nothing && (return false)
    o.id === nothing && (return false)
    o.name === nothing && (return false)
    o.requirement === nothing && (return false)
    o.time_frame === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{VariableReserveNonSpinning}, name::Symbol, val)
end
