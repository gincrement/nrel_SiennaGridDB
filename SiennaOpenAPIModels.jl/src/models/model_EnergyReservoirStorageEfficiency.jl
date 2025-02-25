# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

@doc raw"""EnergyReservoirStorage_efficiency

    EnergyReservoirStorageEfficiency(;
        in=nothing,
        out=nothing,
    )

    - in::Float64
    - out::Float64
"""
Base.@kwdef mutable struct EnergyReservoirStorageEfficiency <: OpenAPI.APIModel
    in::Union{Nothing, Float64} = nothing
    out::Union{Nothing, Float64} = nothing

    function EnergyReservoirStorageEfficiency(in, out)
        OpenAPI.validate_property(EnergyReservoirStorageEfficiency, Symbol("in"), in)
        OpenAPI.validate_property(EnergyReservoirStorageEfficiency, Symbol("out"), out)
        return new(in, out)
    end
end # type EnergyReservoirStorageEfficiency

const _property_types_EnergyReservoirStorageEfficiency =
    Dict{Symbol, String}(Symbol("in") => "Float64", Symbol("out") => "Float64")
OpenAPI.property_type(::Type{EnergyReservoirStorageEfficiency}, name::Symbol) = Union{
    Nothing,
    eval(Base.Meta.parse(_property_types_EnergyReservoirStorageEfficiency[name])),
}

function check_required(o::EnergyReservoirStorageEfficiency)
    true
end

function OpenAPI.validate_property(
    ::Type{EnergyReservoirStorageEfficiency},
    name::Symbol,
    val,
)
end
