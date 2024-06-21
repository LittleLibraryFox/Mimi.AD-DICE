# API

OptMimiDICE2016R2 is an expanded version of [MimiDICE2016R2](https://github.com/anthofflab/MimiDICE2016R2.jl). This means that every piece of code that works with MimiDICE should also work with OptMimiDICE - it is backwards-compatible. The introduced changes are merely additions that concern the optimisation of the DICE model.

## Getting the model

The function [`OptMimiDICE2016R2.get_model`](@ref) is essentially unchanged, but listed here because it is central to using OptMimiDICE2016R2.

```@docs
OptMimiDICE2016R2.get_model
```

## Optimising the model

The two entirely new functions are listed below. `optimise_model` is exported by OptMimiDICE2016R2 and can hence be called from outside the module. `construct_objective` is called by `optimise_model` and is not exported.

```@docs
optimise_model
construct_objective
```

## Index

```@index
```