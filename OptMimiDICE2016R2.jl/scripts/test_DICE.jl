##% GET PACKAGES

using Mimi
# include code of main model file, in which the module MimiDICE2016R2_opt is defined
include("../src/OptMimiDICE2016R2.jl")
# load module MimiDICE2016R2_opt with the respective exported functions constructdice, get_model, optimise_model
using Main.OptMimiDICE2016R2

# ----------------------------------------------------------
#%% GET MODELS
# ----------------------------------------------------------

# Get standard DICE2016R2 baseline model
m_base = get_model()
time_steps = length(OptMimiDICE2016R2.model_years)
t = collect(OptMimiDICE2016R2.model_years)

# Howard & Sterner damage specification including productivity effect
# update_param!(m_base, :damages, :a2, 0.01145)

run(m_base);

#%% Get standard DICE optimised model
m_opt = get_model()

# Howard & Sterner damage specification including productivity effect
# update_param!(m_opt, :damages, :a2, 0.01145)

run(m_opt)
@time m_opt, diagn_opt = optimise_model(m_opt, backup_timesteps=0);

# ----------------------------------------------------------
#%% GET RESULTS
# ----------------------------------------------------------

E_base = m_base[:emissions, :E]
E_opt = m_opt[:emissions, :E]

T_base = m_base[:climatedynamics, :TATM]
T_opt = m_opt[:climatedynamics, :TATM]

# ----------------------------------------------------------
#%% PLOT
# ----------------------------------------------------------
using PyCall
using PyPlot
plt = pyimport("matplotlib.pyplot")

fig = plt.figure(figsize=(10, 5))
ax  = fig.add_subplot(111)
ax.grid()

ax.set_xlabel("Year")
ax.set_ylabel("Temperature")
ax.set_xlim((2015, 2515))
ax.set_ylim((0, 10))

ax2 = ax.twinx()
ax2.set_ylabel("Emissions")
ax2.set_ylim((-20, 80))

ax.plot(t, T_opt, label="Optimised T")
ax2.plot(t, E_opt, ":", label="Optimised E")
ax.plot(t, T_base, label="Baseline T")
ax2.plot(t, E_base, ":", label="Baseline T")

lines, labels = ax.get_legend_handles_labels()
lines2, labels2 = ax2.get_legend_handles_labels()
ax.legend(vcat(lines, lines2), vcat(labels, labels2), loc=1)

fig.savefig("plots/Current_Plot.pdf", bbox_inches="tight")