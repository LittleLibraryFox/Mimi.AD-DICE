# OptMimiDICE2016R2

This repository is a fork of the [MimiDICE2016R2.jl](https://github.com/anthofflab/MimiDICE2016R2.jl) project by [anthofflab](https://github.com/anthofflab). As the name suggests, this version adds an optimisation routine to MimiDICE2016R2, which is located in src/optimise.jl. Due to package compatibility issues, I do not use the [OptiMimi](https://juliapackages.com/p/optimimi) framework, but instead I work with the [NLOpt](https://www.juliapackages.com/p/nlopt) package. This implementation is inspired by the [code](https://github.com/Environment-Research/Utilitarianism/blob/master/src/helper_functions.jl) for [Budolfson et al. (2021)](https://www.nature.com/articles/s41558-021-01130-6).

This version is still **provisional and untested**. The documentation and testing is still work in progress.

## MimiDICE2016R2

This repository builds on [MimiDICE2016R2.jl](https://github.com/anthofflab/MimiDICE2016R2.jl), which is described below:

*This repository is a work-in-progress implementation of the DICE 2016R2 model, originally created in GAMS and described [here](https://sites.google.com/site/williamdnordhaus/dice-rice) and in the following paper:*

*Nordhaus, William. 2018. "Projections and Uncertainties about Climate Change in an Era of Minimal Climate Policies." American Economic Journal: Economic Policy, 10 (3): 333-60.*

_**As of now this is a WIP, as we are still working on getting testing of our outputs to properly match the outputs of the GAMS model runs. Anyone interested in helping with this effort is encouraged to reach out!**_

*As described in  Nordhaus, William. 2018. "Projections and Uncertainties about Climate Change in an Era of Minimal Climate Policies." American Economic Journal: Economic Policy, 10 (3): 333-60 the only difference between the difference between this repository and [MimiDICE2016]() is the damage function parameter setting of the `a2` damage quadratic term parameter to 0.0027 as opposed to 0.00236 as set in DICE2016R.*

## Documentation

The OptMimiDICE2016R2 documentation can be accessed here: [https://felixschaumann.github.io/OptMimiDICE2016R2.jl/dev](https://felixschaumann.github.io/OptMimiDICE2016R2.jl/dev)