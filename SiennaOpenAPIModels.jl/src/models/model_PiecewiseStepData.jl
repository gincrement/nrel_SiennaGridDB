# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""PiecewiseStepData

    PiecewiseStepData(;
        function_type="PIECEWISE_STEP",
        x_coords=nothing,
        y_coords=nothing,
    )

    - function_type::String
    - x_coords::Vector{Float64}
    - y_coords::Vector{Float64}
"""
Base.@kwdef mutable struct PiecewiseStepData <: OpenAPI.APIModel
    function_type::Union{Nothing, String} = "PIECEWISE_STEP"
    x_coords::Union{Nothing, Vector{Float64}} = nothing
    y_coords::Union{Nothing, Vector{Float64}} = nothing

    function PiecewiseStepData(function_type, x_coords, y_coords, )
        OpenAPI.validate_property(PiecewiseStepData, Symbol("function_type"), function_type)
        OpenAPI.validate_property(PiecewiseStepData, Symbol("x_coords"), x_coords)
        OpenAPI.validate_property(PiecewiseStepData, Symbol("y_coords"), y_coords)
        return new(function_type, x_coords, y_coords, )
    end
end # type PiecewiseStepData

const _property_types_PiecewiseStepData = Dict{Symbol,String}(Symbol("function_type")=>"String", Symbol("x_coords")=>"Vector{Float64}", Symbol("y_coords")=>"Vector{Float64}", )
OpenAPI.property_type(::Type{ PiecewiseStepData }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_PiecewiseStepData[name]))}

function check_required(o::PiecewiseStepData)
    o.function_type === nothing && (return false)
    o.x_coords === nothing && (return false)
    o.y_coords === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ PiecewiseStepData }, name::Symbol, val)

    if name === Symbol("function_type")
        OpenAPI.validate_param(name, "PiecewiseStepData", :enum, val, ["PIECEWISE_STEP"])
    end



end
