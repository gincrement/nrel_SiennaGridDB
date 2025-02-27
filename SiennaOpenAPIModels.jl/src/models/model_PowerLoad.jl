# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""PowerLoad

    PowerLoad(;
        name=nothing,
        id=nothing,
        available=nothing,
        bus=nothing,
        active_power=nothing,
        reactive_power=nothing,
        base_power=nothing,
        max_active_power=nothing,
        max_reactive_power=nothing,
        dynamic_injector=nothing,
    )

    - name::String
    - id::Int64
    - available::Bool
    - bus::Int64
    - active_power::Float64
    - reactive_power::Float64
    - base_power::Float64
    - max_active_power::Float64
    - max_reactive_power::Float64
    - dynamic_injector::Any
"""
Base.@kwdef mutable struct PowerLoad <: OpenAPI.APIModel
    name::Union{Nothing, String} = nothing
    id::Union{Nothing, Int64} = nothing
    available::Union{Nothing, Bool} = nothing
    bus::Union{Nothing, Int64} = nothing
    active_power::Union{Nothing, Float64} = nothing
    reactive_power::Union{Nothing, Float64} = nothing
    base_power::Union{Nothing, Float64} = nothing
    max_active_power::Union{Nothing, Float64} = nothing
    max_reactive_power::Union{Nothing, Float64} = nothing
    dynamic_injector::Union{Nothing, Any} = nothing

    function PowerLoad(name, id, available, bus, active_power, reactive_power, base_power, max_active_power, max_reactive_power, dynamic_injector, )
        OpenAPI.validate_property(PowerLoad, Symbol("name"), name)
        OpenAPI.validate_property(PowerLoad, Symbol("id"), id)
        OpenAPI.validate_property(PowerLoad, Symbol("available"), available)
        OpenAPI.validate_property(PowerLoad, Symbol("bus"), bus)
        OpenAPI.validate_property(PowerLoad, Symbol("active_power"), active_power)
        OpenAPI.validate_property(PowerLoad, Symbol("reactive_power"), reactive_power)
        OpenAPI.validate_property(PowerLoad, Symbol("base_power"), base_power)
        OpenAPI.validate_property(PowerLoad, Symbol("max_active_power"), max_active_power)
        OpenAPI.validate_property(PowerLoad, Symbol("max_reactive_power"), max_reactive_power)
        OpenAPI.validate_property(PowerLoad, Symbol("dynamic_injector"), dynamic_injector)
        return new(name, id, available, bus, active_power, reactive_power, base_power, max_active_power, max_reactive_power, dynamic_injector, )
    end
end # type PowerLoad

const _property_types_PowerLoad = Dict{Symbol,String}(Symbol("name")=>"String", Symbol("id")=>"Int64", Symbol("available")=>"Bool", Symbol("bus")=>"Int64", Symbol("active_power")=>"Float64", Symbol("reactive_power")=>"Float64", Symbol("base_power")=>"Float64", Symbol("max_active_power")=>"Float64", Symbol("max_reactive_power")=>"Float64", Symbol("dynamic_injector")=>"Any", )
OpenAPI.property_type(::Type{ PowerLoad }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_PowerLoad[name]))}

function check_required(o::PowerLoad)
    o.name === nothing && (return false)
    o.id === nothing && (return false)
    o.available === nothing && (return false)
    o.bus === nothing && (return false)
    o.active_power === nothing && (return false)
    o.reactive_power === nothing && (return false)
    o.base_power === nothing && (return false)
    o.max_active_power === nothing && (return false)
    o.max_reactive_power === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ PowerLoad }, name::Symbol, val)










end
