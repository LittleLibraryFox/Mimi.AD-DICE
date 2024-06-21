# Technicalities

This repository is a fork of the [MimiDICE2016R2.jl](https://github.com/anthofflab/MimiDICE2016R2.jl) project by [anthofflab](https://github.com/anthofflab). As the name suggests, this version adds an optimisation routine to MimiDICE2016R2, which is located in src/optimise.jl. Due to package compatibility issues, I do not use the [OptiMimi](https://juliapackages.com/p/optimimi) framework, but instead I work with the [NLOpt](https://www.juliapackages.com/p/nlopt) package. This implementation is inspired by the [code](https://github.com/Environment-Research/Utilitarianism/blob/master/src/helper_functions.jl) for [Budolfson et al. (2021)](https://www.nature.com/articles/s41558-021-01130-6).

This version is still **provisional and untested**. The documentation and testing is still work in progress.
