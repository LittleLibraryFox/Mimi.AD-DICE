# Using OptMimiDICE2016R2

## Software Requirements

You need to install [Julia 1.1.0](https://julialang.org) or newer to run this model. You can download Julia from http://julialang.org/downloads/.

## Preparing the Software Environment

To install OptMimiDICE2016R2.jl, you need to run the following command at the julia package REPL:

```julia
pkg> add https://github.com/felixschaumann/OptMimiDICE2016R2.jl
```
*Note: This will only work if you have not previously installed MimiDICE2016R2.jl, as they share the same package ID.*

You probably also want to install the Mimi package into your julia environment, so that you can use some of the tools in there:

```julia
pkg> add Mimi
```
## Running the model

The model uses the Mimi framework and it is highly recommended to read the Mimi documentation first to understand the code structure. For starter code on running the model just once, see the code in the file `examples/main.jl`.

The basic way to access a copy of the default OptMimiDICE2016R2 model is the following:
```
using OptMimiDICE2016R2

m = OptMimiDICE2016R2.get_model()
run(m)
```

## Optimising the model

work in progress

### Modifying the model

work in progress

## Calculating the Social Cost of Carbon

Here is an example of computing the social cost of carbon with OptMimiDICE2016R2. Note that the units of the returned value are 2010US$/tCO2.
```
using Mimi
using OptMimiDICE2016

# Get the social cost of carbon in year 2020 from the default OptMimiDICE2016 model:
scc = OptMimiDICE2016.compute_scc(year = 2020)

# You can also compute the SCC from a modified version of a OptMimiDICE2016 model:
m = OptMimiDICE2016.get_model()    # Get the default version of the OptMimiDICE2016 model
update_param!(m, :t2xco2, 5)    # Try a higher climate sensitivity value
scc = OptMimiDICE2016.compute_scc(m, year = 2020)    # compute the scc from the modified model by passing it as the first argument to compute_scc
```
The first argument to the `compute_scc` function is a OptMimiDICE2016 model, and it is an optional argument. If no model is provided, the default OptMimiDICE2016 model will be used. 
There are also other keyword arguments available to `compute_scc`. Note that the user must specify a `year` for the SCC calculation, but the rest of the keyword arguments have default values.
```
compute_scc(m = get_model(),  # if no model provided, will use the default OptMimiDICE2016 model
    year = nothing,  # user must specify an emission year for the SCC calculation
    last_year = 2510,  # the last year to run and use for the SCC calculation. Default is the last year of the time dimension, 2510.
    prtp = 0.03,  # pure rate of time preference parameter used for constant discounting
)
```
There is an additional function for computing the SCC that also returns the MarginalModel that was used to compute it. It returns these two values as a NamedTuple of the form (scc=scc, mm=mm). The same keyword arguments from the `compute_scc` function are available for the `compute_scc_mm` function. Example:
```
using Mimi
using OptMimiDICE2016

result = OptMimiDICE2016.compute_scc_mm(year=2030, last_year=2300, prtp=0.025)

result.scc  # returns the computed SCC value

result.mm   # returns the Mimi MarginalModel

marginal_temp = result.mm[:climatedynamics, :TATM]  # marginal results from the marginal model can be accessed like this
```

### Pulse Size Details

By default, OptMimiDICE2016 will calculate the SCC using a marginal emissions pulse of 5 GtCO2 spread over five years, or 1 GtCO2 per year for five years.  The SCC will always be returned in $ per ton CO2 since is normalized by this pulse size. This choice of pulse size and duration is a decision made based on experiments with stability of results and moving from continuous to discretized equations, and can be found described further in the literature around DICE.

For a deeper dive into the machinery of this function, see the forum conversation [here](https://forum.mimiframework.org/t/mimifund-emissions-pulse/153/9), which is focused on MimiFUND but has similar internal machinery to OptMimiDICE2016, and the docstrings in `marginaldamage.jl`.

