# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""SwitchedAdmittance

    SwitchedAdmittance(;
        name=nothing,
        id=nothing,
        available=nothing,
        bus=nothing,
        Y=nothing,
        number_of_steps=0,
        Y_increase=nothing,
        dynamic_injector=nothing,
    )

    - name::String
    - id::Int64
    - available::Bool
    - bus::Int64
    - Y::ComplexNumber
    - number_of_steps::Int64
    - Y_increase::ComplexNumber
    - dynamic_injector::Any
"""
Base.@kwdef mutable struct SwitchedAdmittance <: OpenAPI.APIModel
    name::Union{Nothing, String} = nothing
    id::Union{Nothing, Int64} = nothing
    available::Union{Nothing, Bool} = nothing
    bus::Union{Nothing, Int64} = nothing
    Y = nothing # spec type: Union{ Nothing, ComplexNumber }
    number_of_steps::Union{Nothing, Int64} = 0
    Y_increase = nothing # spec type: Union{ Nothing, ComplexNumber }
    dynamic_injector::Union{Nothing, Any} = nothing

    function SwitchedAdmittance(name, id, available, bus, Y, number_of_steps, Y_increase, dynamic_injector, )
        OpenAPI.validate_property(SwitchedAdmittance, Symbol("name"), name)
        OpenAPI.validate_property(SwitchedAdmittance, Symbol("id"), id)
        OpenAPI.validate_property(SwitchedAdmittance, Symbol("available"), available)
        OpenAPI.validate_property(SwitchedAdmittance, Symbol("bus"), bus)
        OpenAPI.validate_property(SwitchedAdmittance, Symbol("Y"), Y)
        OpenAPI.validate_property(SwitchedAdmittance, Symbol("number_of_steps"), number_of_steps)
        OpenAPI.validate_property(SwitchedAdmittance, Symbol("Y_increase"), Y_increase)
        OpenAPI.validate_property(SwitchedAdmittance, Symbol("dynamic_injector"), dynamic_injector)
        return new(name, id, available, bus, Y, number_of_steps, Y_increase, dynamic_injector, )
    end
end # type SwitchedAdmittance

const _property_types_SwitchedAdmittance = Dict{Symbol,String}(Symbol("name")=>"String", Symbol("id")=>"Int64", Symbol("available")=>"Bool", Symbol("bus")=>"Int64", Symbol("Y")=>"ComplexNumber", Symbol("number_of_steps")=>"Int64", Symbol("Y_increase")=>"ComplexNumber", Symbol("dynamic_injector")=>"Any", )
OpenAPI.property_type(::Type{ SwitchedAdmittance }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_SwitchedAdmittance[name]))}

function check_required(o::SwitchedAdmittance)
    o.name === nothing && (return false)
    o.id === nothing && (return false)
    o.available === nothing && (return false)
    o.bus === nothing && (return false)
    o.Y === nothing && (return false)
    true
end

function OpenAPI.validate_property(::Type{ SwitchedAdmittance }, name::Symbol, val)








end
