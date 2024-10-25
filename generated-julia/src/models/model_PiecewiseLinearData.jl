# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""PiecewiseLinearData

    PiecewiseLinearData(;
        function_type=nothing,
        points=nothing,
    )

    - function_type::String
    - points::Vector{PiecewiseLinearDataPointsInner}
"""
Base.@kwdef mutable struct PiecewiseLinearData <: OpenAPI.APIModel
    function_type::Union{Nothing, String} = nothing
    points::Union{Nothing, Vector} = nothing # spec type: Union{ Nothing, Vector{PiecewiseLinearDataPointsInner} }

    function PiecewiseLinearData(function_type, points, )
        OpenAPI.validate_property(PiecewiseLinearData, Symbol("function_type"), function_type)
        OpenAPI.validate_property(PiecewiseLinearData, Symbol("points"), points)
        return new(function_type, points, )
    end
end # type PiecewiseLinearData

const _property_types_PiecewiseLinearData = Dict{Symbol,String}(Symbol("function_type")=>"String", Symbol("points")=>"Vector{PiecewiseLinearDataPointsInner}", )
OpenAPI.property_type(::Type{ PiecewiseLinearData }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_PiecewiseLinearData[name]))}

function check_required(o::PiecewiseLinearData)
    o.points === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ PiecewiseLinearData }, name::Symbol, val)
    if name === Symbol("function_type")
        OpenAPI.validate_param(name, "PiecewiseLinearData", :enum, val, ["PIECEWISE_LINEAR"])
    end
end
