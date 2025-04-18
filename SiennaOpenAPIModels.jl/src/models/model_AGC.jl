# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""AGC

    AGC(;
        area=nothing,
        available=nothing,
        bias=nothing,
        delta_t=nothing,
        id=nothing,
        initial_ace=0.0,
        K_p=nothing,
        K_i=nothing,
        K_d=nothing,
        name=nothing,
    )

    - area::Int64
    - available::Bool
    - bias::Float64
    - delta_t::Float64
    - id::Int64
    - initial_ace::Float64
    - K_p::Float64
    - K_i::Float64
    - K_d::Float64
    - name::String
"""
Base.@kwdef mutable struct AGC <: OpenAPI.APIModel
    area::Union{Nothing, Int64} = nothing
    available::Union{Nothing, Bool} = nothing
    bias::Union{Nothing, Float64} = nothing
    delta_t::Union{Nothing, Float64} = nothing
    id::Union{Nothing, Int64} = nothing
    initial_ace::Union{Nothing, Float64} = 0.0
    K_p::Union{Nothing, Float64} = nothing
    K_i::Union{Nothing, Float64} = nothing
    K_d::Union{Nothing, Float64} = nothing
    name::Union{Nothing, String} = nothing

    function AGC(area, available, bias, delta_t, id, initial_ace, K_p, K_i, K_d, name, )
        OpenAPI.validate_property(AGC, Symbol("area"), area)
        OpenAPI.validate_property(AGC, Symbol("available"), available)
        OpenAPI.validate_property(AGC, Symbol("bias"), bias)
        OpenAPI.validate_property(AGC, Symbol("delta_t"), delta_t)
        OpenAPI.validate_property(AGC, Symbol("id"), id)
        OpenAPI.validate_property(AGC, Symbol("initial_ace"), initial_ace)
        OpenAPI.validate_property(AGC, Symbol("K_p"), K_p)
        OpenAPI.validate_property(AGC, Symbol("K_i"), K_i)
        OpenAPI.validate_property(AGC, Symbol("K_d"), K_d)
        OpenAPI.validate_property(AGC, Symbol("name"), name)
        return new(area, available, bias, delta_t, id, initial_ace, K_p, K_i, K_d, name, )
    end
end # type AGC

const _property_types_AGC = Dict{Symbol,String}(Symbol("area")=>"Int64", Symbol("available")=>"Bool", Symbol("bias")=>"Float64", Symbol("delta_t")=>"Float64", Symbol("id")=>"Int64", Symbol("initial_ace")=>"Float64", Symbol("K_p")=>"Float64", Symbol("K_i")=>"Float64", Symbol("K_d")=>"Float64", Symbol("name")=>"String", )
OpenAPI.property_type(::Type{ AGC }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_AGC[name]))}

function check_required(o::AGC)
    o.available === nothing && (return false)
    o.bias === nothing && (return false)
    o.delta_t === nothing && (return false)
    o.id === nothing && (return false)
    o.K_p === nothing && (return false)
    o.K_i === nothing && (return false)
    o.K_d === nothing && (return false)
    o.name === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ AGC }, name::Symbol, val)










end
