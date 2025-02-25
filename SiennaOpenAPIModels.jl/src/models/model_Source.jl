# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

@doc raw"""Source

    Source(;
        name=nothing,
        id=nothing,
        available=nothing,
        bus=nothing,
        active_power=nothing,
        reactive_power=nothing,
        R_th=nothing,
        X_th=nothing,
        internal_voltage=1.0,
        internal_angle=0.0,
        base_power=100.0,
        dynamic_injector=nothing,
    )

    - name::String
    - id::Int64
    - available::Bool
    - bus::Int64
    - active_power::Float64
    - reactive_power::Float64
    - R_th::Float64
    - X_th::Float64
    - internal_voltage::Float64
    - internal_angle::Float64
    - base_power::Float64
    - dynamic_injector::Any
"""
Base.@kwdef mutable struct Source <: OpenAPI.APIModel
    name::Union{Nothing, String} = nothing
    id::Union{Nothing, Int64} = nothing
    available::Union{Nothing, Bool} = nothing
    bus::Union{Nothing, Int64} = nothing
    active_power::Union{Nothing, Float64} = nothing
    reactive_power::Union{Nothing, Float64} = nothing
    R_th::Union{Nothing, Float64} = nothing
    X_th::Union{Nothing, Float64} = nothing
    internal_voltage::Union{Nothing, Float64} = 1.0
    internal_angle::Union{Nothing, Float64} = 0.0
    base_power::Union{Nothing, Float64} = 100.0
    dynamic_injector::Union{Nothing, Any} = nothing

    function Source(
        name,
        id,
        available,
        bus,
        active_power,
        reactive_power,
        R_th,
        X_th,
        internal_voltage,
        internal_angle,
        base_power,
        dynamic_injector,
    )
        OpenAPI.validate_property(Source, Symbol("name"), name)
        OpenAPI.validate_property(Source, Symbol("id"), id)
        OpenAPI.validate_property(Source, Symbol("available"), available)
        OpenAPI.validate_property(Source, Symbol("bus"), bus)
        OpenAPI.validate_property(Source, Symbol("active_power"), active_power)
        OpenAPI.validate_property(Source, Symbol("reactive_power"), reactive_power)
        OpenAPI.validate_property(Source, Symbol("R_th"), R_th)
        OpenAPI.validate_property(Source, Symbol("X_th"), X_th)
        OpenAPI.validate_property(Source, Symbol("internal_voltage"), internal_voltage)
        OpenAPI.validate_property(Source, Symbol("internal_angle"), internal_angle)
        OpenAPI.validate_property(Source, Symbol("base_power"), base_power)
        OpenAPI.validate_property(Source, Symbol("dynamic_injector"), dynamic_injector)
        return new(
            name,
            id,
            available,
            bus,
            active_power,
            reactive_power,
            R_th,
            X_th,
            internal_voltage,
            internal_angle,
            base_power,
            dynamic_injector,
        )
    end
end # type Source

const _property_types_Source = Dict{Symbol, String}(
    Symbol("name") => "String",
    Symbol("id") => "Int64",
    Symbol("available") => "Bool",
    Symbol("bus") => "Int64",
    Symbol("active_power") => "Float64",
    Symbol("reactive_power") => "Float64",
    Symbol("R_th") => "Float64",
    Symbol("X_th") => "Float64",
    Symbol("internal_voltage") => "Float64",
    Symbol("internal_angle") => "Float64",
    Symbol("base_power") => "Float64",
    Symbol("dynamic_injector") => "Any",
)
OpenAPI.property_type(::Type{Source}, name::Symbol) =
    Union{Nothing, eval(Base.Meta.parse(_property_types_Source[name]))}

function check_required(o::Source)
    o.name === nothing && (return false)
    o.id === nothing && (return false)
    o.available === nothing && (return false)
    o.bus === nothing && (return false)
    o.active_power === nothing && (return false)
    o.reactive_power === nothing && (return false)
    o.R_th === nothing && (return false)
    o.X_th === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{Source}, name::Symbol, val)
end
