# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""MonitoredLine

    MonitoredLine(;
        active_power_flow=nothing,
        angle_limits=nothing,
        arc=nothing,
        available=nothing,
        b=nothing,
        flow_limits=nothing,
        g=nothing,
        id=nothing,
        name=nothing,
        r=nothing,
        rating=nothing,
        reactive_power_flow=nothing,
        x=nothing,
    )

    - active_power_flow::Float64
    - angle_limits::MinMax
    - arc::LineArc
    - available::Bool
    - b::FromTo
    - flow_limits::FromToToFrom
    - g::FromTo
    - id::Int64
    - name::String
    - r::Float64
    - rating::Float64
    - reactive_power_flow::Float64
    - x::Float64
"""
Base.@kwdef mutable struct MonitoredLine <: OpenAPI.APIModel
    active_power_flow::Union{Nothing,Float64} = nothing
    angle_limits = nothing # spec type: Union{ Nothing, MinMax }
    arc = nothing # spec type: Union{ Nothing, LineArc }
    available::Union{Nothing,Bool} = nothing
    b = nothing # spec type: Union{ Nothing, FromTo }
    flow_limits = nothing # spec type: Union{ Nothing, FromToToFrom }
    g = nothing # spec type: Union{ Nothing, FromTo }
    id::Union{Nothing,Int64} = nothing
    name::Union{Nothing,String} = nothing
    r::Union{Nothing,Float64} = nothing
    rating::Union{Nothing,Float64} = nothing
    reactive_power_flow::Union{Nothing,Float64} = nothing
    x::Union{Nothing,Float64} = nothing

    function MonitoredLine(
        active_power_flow,
        angle_limits,
        arc,
        available,
        b,
        flow_limits,
        g,
        id,
        name,
        r,
        rating,
        reactive_power_flow,
        x,
    )
        OpenAPI.validate_property(
            MonitoredLine,
            Symbol("active_power_flow"),
            active_power_flow,
        )
        OpenAPI.validate_property(MonitoredLine, Symbol("angle_limits"), angle_limits)
        OpenAPI.validate_property(MonitoredLine, Symbol("arc"), arc)
        OpenAPI.validate_property(MonitoredLine, Symbol("available"), available)
        OpenAPI.validate_property(MonitoredLine, Symbol("b"), b)
        OpenAPI.validate_property(MonitoredLine, Symbol("flow_limits"), flow_limits)
        OpenAPI.validate_property(MonitoredLine, Symbol("g"), g)
        OpenAPI.validate_property(MonitoredLine, Symbol("id"), id)
        OpenAPI.validate_property(MonitoredLine, Symbol("name"), name)
        OpenAPI.validate_property(MonitoredLine, Symbol("r"), r)
        OpenAPI.validate_property(MonitoredLine, Symbol("rating"), rating)
        OpenAPI.validate_property(
            MonitoredLine,
            Symbol("reactive_power_flow"),
            reactive_power_flow,
        )
        OpenAPI.validate_property(MonitoredLine, Symbol("x"), x)
        return new(
            active_power_flow,
            angle_limits,
            arc,
            available,
            b,
            flow_limits,
            g,
            id,
            name,
            r,
            rating,
            reactive_power_flow,
            x,
        )
    end
end # type MonitoredLine

const _property_types_MonitoredLine = Dict{Symbol,String}(
    Symbol("active_power_flow") => "Float64",
    Symbol("angle_limits") => "MinMax",
    Symbol("arc") => "LineArc",
    Symbol("available") => "Bool",
    Symbol("b") => "FromTo",
    Symbol("flow_limits") => "FromToToFrom",
    Symbol("g") => "FromTo",
    Symbol("id") => "Int64",
    Symbol("name") => "String",
    Symbol("r") => "Float64",
    Symbol("rating") => "Float64",
    Symbol("reactive_power_flow") => "Float64",
    Symbol("x") => "Float64",
)
OpenAPI.property_type(::Type{MonitoredLine}, name::Symbol) =
    Union{Nothing,eval(Base.Meta.parse(_property_types_MonitoredLine[name]))}

function check_required(o::MonitoredLine)
    o.active_power_flow === nothing && (return false)
    o.angle_limits === nothing && (return false)
    o.arc === nothing && (return false)
    o.available === nothing && (return false)
    o.b === nothing && (return false)
    o.flow_limits === nothing && (return false)
    o.id === nothing && (return false)
    o.name === nothing && (return false)
    o.r === nothing && (return false)
    o.rating === nothing && (return false)
    o.reactive_power_flow === nothing && (return false)
    o.x === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{MonitoredLine}, name::Symbol, val)













end
