using Mimi
include("../src/OptMimiDICE2016R2.jl")
# using OptMimiDICE2016R2

DICE = OptMimiDICE2016R2.get_model()
run(DICE)

# Howard & Sterner damage specification including productivity effect
update_param!(DICE, :damages, :a3, 3.0000000)
update_param!(DICE, :climatedynamics, :t2xco2, 2)

@time opt_DICE, diagn = OptMimiDICE2016R2.optimise_model(DICE, n_objectives=60)

explore(DICE)
