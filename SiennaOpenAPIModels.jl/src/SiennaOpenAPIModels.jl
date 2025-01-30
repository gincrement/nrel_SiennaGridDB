# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""
Encapsulates generated server code for APIServer

The following server methods must be implemented:

"""
module SiennaOpenAPIModels

using OpenAPI
using StructHelpers: @batteries
import PowerSystems

const PSY = PowerSystems
const API_VERSION = "1.0.0"

export psy2openapi
export IDGenerator
export getid!

include("modelincludes.jl")

@batteries MinMax
@batteries UpDown
@batteries ThermalGenerationCostStartUp
@batteries StartUpStages
@batteries ProductionVariableCostCurve
@batteries CostCurve
@batteries ValueCurve
@batteries FuelCurve
@batteries FuelCurveFuelCost
@batteries InputOutputCurve
@batteries InputOutputCurveFunctionData
@batteries AverageRateCurve
@batteries AverageRateCurveFunctionData
@batteries IncrementalCurve
@batteries IncrementalCurveFunctionData
@batteries LinearFunctionData
@batteries QuadraticFunctionData
@batteries PiecewiseLinearData
@batteries XYCoords
@batteries PiecewiseStepData
@batteries ThermalStandard
@batteries ThermalGenerationCost
@batteries ACBus
@batteries Arc
@batteries Line
@batteries FromTo
@batteries PowerLoad
@batteries StandardLoad

include("sienna_to_json/common.jl")
include("sienna_to_json/static_injections.jl")
include("sienna_to_json/topology.jl")
include("sienna_to_json/branch.jl")

"""
Register handlers for all APIs in this module in the supplied `Router` instance.

Paramerets:
- `router`: Router to register handlers in
- `impl`: module that implements the server methods

Optional parameters:
- `path_prefix`: prefix to be applied to all paths
- `optional_middlewares`: Register one or more optional middlewares to be applied to all requests.

Optional middlewares can be one or more of:
	- `init`: called before the request is processed
	- `pre_validation`: called after the request is parsed but before validation
	- `pre_invoke`: called after validation but before the handler is invoked
	- `post_invoke`: called after the handler is invoked but before the response is sent

The order in which middlewares are invoked are:
`init |> read |> pre_validation |> validate |> pre_invoke |> invoke |> post_invoke`
"""

end # module APIServer
