# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

@doc raw"""TModelHVDCLine

    TModelHVDCLine(;
        active_power_limits_from=nothing,
        active_power_limits_to=nothing,
        active_power_flow=nothing,
        arc=nothing,
        available=nothing,
        c=nothing,
        id=nothing,
        l=nothing,
        name=nothing,
        r=nothing,
    )

    - active_power_limits_from::MinMax
    - active_power_limits_to::MinMax
    - active_power_flow::Float64
    - arc::Int64
    - available::Bool
    - c::Float64
    - id::Int64
    - l::Int64
    - name::String
    - r::Float64
"""
Base.@kwdef mutable struct TModelHVDCLine <: OpenAPI.APIModel
    active_power_limits_from = nothing # spec type: Union{ Nothing, MinMax }
    active_power_limits_to = nothing # spec type: Union{ Nothing, MinMax }
    active_power_flow::Union{Nothing, Float64} = nothing
    arc::Union{Nothing, Int64} = nothing
    available::Union{Nothing, Bool} = nothing
    c::Union{Nothing, Float64} = nothing
    id::Union{Nothing, Int64} = nothing
    l::Union{Nothing, Int64} = nothing
    name::Union{Nothing, String} = nothing
    r::Union{Nothing, Float64} = nothing

    function TModelHVDCLine(
        active_power_limits_from,
        active_power_limits_to,
        active_power_flow,
        arc,
        available,
        c,
        id,
        l,
        name,
        r,
    )
        OpenAPI.validate_property(
            TModelHVDCLine,
            Symbol("active_power_limits_from"),
            active_power_limits_from,
        )
        OpenAPI.validate_property(
            TModelHVDCLine,
            Symbol("active_power_limits_to"),
            active_power_limits_to,
        )
        OpenAPI.validate_property(
            TModelHVDCLine,
            Symbol("active_power_flow"),
            active_power_flow,
        )
        OpenAPI.validate_property(TModelHVDCLine, Symbol("arc"), arc)
        OpenAPI.validate_property(TModelHVDCLine, Symbol("available"), available)
        OpenAPI.validate_property(TModelHVDCLine, Symbol("c"), c)
        OpenAPI.validate_property(TModelHVDCLine, Symbol("id"), id)
        OpenAPI.validate_property(TModelHVDCLine, Symbol("l"), l)
        OpenAPI.validate_property(TModelHVDCLine, Symbol("name"), name)
        OpenAPI.validate_property(TModelHVDCLine, Symbol("r"), r)
        return new(
            active_power_limits_from,
            active_power_limits_to,
            active_power_flow,
            arc,
            available,
            c,
            id,
            l,
            name,
            r,
        )
    end
end # type TModelHVDCLine

const _property_types_TModelHVDCLine = Dict{Symbol, String}(
    Symbol("active_power_limits_from") => "MinMax",
    Symbol("active_power_limits_to") => "MinMax",
    Symbol("active_power_flow") => "Float64",
    Symbol("arc") => "Int64",
    Symbol("available") => "Bool",
    Symbol("c") => "Float64",
    Symbol("id") => "Int64",
    Symbol("l") => "Int64",
    Symbol("name") => "String",
    Symbol("r") => "Float64",
)
OpenAPI.property_type(::Type{TModelHVDCLine}, name::Symbol) =
    Union{Nothing, eval(Base.Meta.parse(_property_types_TModelHVDCLine[name]))}

function check_required(o::TModelHVDCLine)
    o.active_power_limits_from === nothing && (return false)
    o.active_power_limits_to === nothing && (return false)
    o.active_power_flow === nothing && (return false)
    o.arc === nothing && (return false)
    o.available === nothing && (return false)
    o.c === nothing && (return false)
    o.id === nothing && (return false)
    o.l === nothing && (return false)
    o.name === nothing && (return false)
    o.r === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{TModelHVDCLine}, name::Symbol, val)
end
