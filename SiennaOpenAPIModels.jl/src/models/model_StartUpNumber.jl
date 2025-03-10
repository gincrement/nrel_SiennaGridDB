# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.

@doc raw"""StartUpNumber
Reference object for discriminator in ThermalGenerationCost start_up param

    StartUpNumber(;
        startup_stages_type="NUMBER",
        startup_number=nothing,
    )

    - startup_stages_type::String
    - startup_number::Float64
"""
Base.@kwdef mutable struct StartUpNumber <: OpenAPI.APIModel
    startup_stages_type::Union{Nothing, String} = "NUMBER"
    startup_number::Union{Nothing, Float64} = nothing

    function StartUpNumber(startup_stages_type, startup_number)
        OpenAPI.validate_property(
            StartUpNumber,
            Symbol("startup_stages_type"),
            startup_stages_type,
        )
        OpenAPI.validate_property(StartUpNumber, Symbol("startup_number"), startup_number)
        return new(startup_stages_type, startup_number)
    end
end # type StartUpNumber

const _property_types_StartUpNumber = Dict{Symbol, String}(
    Symbol("startup_stages_type") => "String",
    Symbol("startup_number") => "Float64",
)
OpenAPI.property_type(::Type{StartUpNumber}, name::Symbol) =
    Union{Nothing, eval(Base.Meta.parse(_property_types_StartUpNumber[name]))}

function check_required(o::StartUpNumber)
    o.startup_number === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{StartUpNumber}, name::Symbol, val)
    if name === Symbol("startup_stages_type")
        OpenAPI.validate_param(name, "StartUpNumber", :enum, val, ["NUMBER"])
    end
end
