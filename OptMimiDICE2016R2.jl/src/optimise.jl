using NLopt
using Mimi

# INSPIRED BY 'Utilitarian Benchmarks for Emissions and Pledges Promote Equity, Climate, and Development.'
# (https://github.com/Environment-Research/Utilitarianism/blob/master/src/helper_functions.jl)

"""
    optimise_model(m::Model=get_model(); kwargs) -> (m::Model, diagnostic::Dict)
    
Optimise DICE2016R2 model instance `m` and return the optimised and updated model together with diagnostic optimisation output.

The model instance `m` is not a mandatory argument. In case it is not provided, the function will use a newly constructed model from [`OptMimiDICE2016R2.get_model`](@ref). It is worth manually passing a model instance if one wishes to optimise a modified version of DICE, e.g. with updated parameters or updated components.

## Keyword arguments:
- `n_objectives::Int=length(model_years)`: number of objectives, which corresponds to the number of time steps in the model
- `stop_time::Int=640`: time in seconds after which optimisation routine stops, passed to `NLopt.ftol_rel!`
- `tolerance::Float64=1e-6`: tolerance requirement passed to `NLopt.ftol_rel!`
- `optimization_algorithm::Symbol=:LN_SBPLX`: algorithm passed to `NLopt.ftol_rel!`
- `backup_timesteps::Int=0`: amount of time steps in model's time dimension before optimisation sets in

## Notes
- This version of DICE only allows for NETs after 2150, and it immediately allows for a 120% emissions reduction rate (`:MIU=1.2`, meaning 20% NETs) in 2155. This constraint can be modified by changing the first half of the `upper_bound` vector.
- The second return value is purely for diagnostic purposes and comes directly from the NLopt optimisation. In normal usage, it can be ignored.

See also [`construct_objective`](@ref).
"""
function optimise_model(m::Model=get_model(); n_objectives::Int=length(model_years), stop_time::Int=640, tolerance::Float64=1e-6, optimization_algorithm::Symbol=:LN_SBPLX, backup_timesteps::Int=0)

    n_objectives + backup_timesteps != length(m.md.dim_dict[:time]) ? error("Number of objectives must correspond to number of timesteps of given model m.") : nothing

    # Create lower bound
    lower_bound = [0.039; zeros(n_objectives-1); zeros(n_objectives)]
    # Create upper bound    
    upper_bound = [0.039; ones(28); 1.2 .* ones(n_objectives-29); ones(n_objectives)] # assume NETs after 2150 and 3.9% emissions reduction in 2015
    
    # Create initial condition for algorithm
    starting_point = [0.03 .* ones(n_objectives); 0.3 .* ones(n_objectives)] # 0.03 as a start for the baseline and for optimised run (miu0 in GAMS code) & 0.3 as an initial savings rate
    
    opt = Opt(optimization_algorithm, 2*n_objectives)

    # Set the bounds.
    lower_bounds!(opt, lower_bound)
    upper_bounds!(opt, upper_bound)

    # Assign the objective function to maximize.
    max_objective!(opt, (x, grad) -> construct_objective(m, x, backup_timesteps, n_objectives))
    
    # Set termination time.
    maxtime!(opt, stop_time)
    
    # Set optimizatoin tolerance (will stop if |Δf| / |f| < tolerance from one iteration to the next).
    ftol_rel!(opt, tolerance)
    
    # Optimize model.
    maximum_objective_value, optimised_policy_econ_vector, convergence_result = optimize(opt, starting_point)
    
    diagnostic = Dict([("Maximum objective value", maximum_objective_value),
                       ("Optimised policy economic vector", optimised_policy_econ_vector),
                       ("Convergence result", convergence_result)])

    convergence_result == :FORCED_STOP ? error("Optimisation failed.") : nothing

    return (m = m, diagnostic = diagnostic)
end
    
"""
    construct_objective(m::Model, optimised_mitigation::Array{Float64,1}, backup_timesteps::Int=0, n_objectives::Int=length(model_years)) -> m[:welfare, :UTILITY]

Updates emissions control rate `:MIU` and savings rate `:S` in model `m` and returns the resulting utility vector. This function is called by [`optimise_model`](@ref). `optimised_mitigation_savings` is a vector of `:MIU` and `:S` values that is being optimised.

`backup_timesteps` gives the amount of timesteps that are part of the model's time dimension without being optimised. For example, the FaIR climate module runs since 1765, but DICE only optimises starting in 2015. `n_objectives` gives the amount of timesteps that are being optimised, such that there are `n_objectives` for `:MIU` and `n_objectives` for `:S`. 

See also [`optimise_model`](@ref).
"""
function construct_objective(m::Model, optimised_mitigation_saving::Array{Float64,1}, backup_timesteps::Int=0, n_objectives::Int=length(model_years))
    # update MIU (abatement variable)
    update_param!(m, :MIU, [Vector{Missing}(missing, backup_timesteps); optimised_mitigation_saving[1:n_objectives]])
    # update S (savings rate)
    update_param!(m, :neteconomy, :S, [Vector{Missing}(missing, backup_timesteps); optimised_mitigation_saving[n_objectives+1:end]])
    # re-build model to evaluate welfare effects
    run(m)
    return m[:welfare, :UTILITY]
end
