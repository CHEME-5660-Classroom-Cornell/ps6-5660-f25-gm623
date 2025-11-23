# setup paths -
const _ROOT = @__DIR__;
const _PATH_TO_SRC = joinpath(_ROOT, "src");
const _PATH_TO_DATA = joinpath(_ROOT, "data");
const _PATH_TO_FIGS = joinpath(_ROOT, "figs");
const _PATH_TO_SIMS = joinpath(_ROOT, "sims");

# make sure all is up to date -
using Pkg
# Activate the local project first to avoid modifying the user's global environment
Pkg.activate(".")
if (isfile(joinpath(_ROOT, "Manifest.toml")) == false)
    # Add the VLQuantitativeFinancePackage into this project environment only.
    # Use `url=` so the add is explicit about the remote repository.
    try
        Pkg.add(url="https://github.com/varnerlab/VLQuantitativeFinancePackage.jl.git")
    catch e
        @warn "Failed to add VLQuantitativeFinancePackage; continuing. Error: $e"
    end
    Pkg.resolve(); Pkg.instantiate(); Pkg.update();
end

# load external packages -
using VLQuantitativeFinancePackage
using DataFrames
using Statistics
using StatsBase
using Plots
using Colors
using PrettyTables
using CSV
using Distributions
using FileIO
using JLD2
using HypothesisTests
using StatsPlots
using LinearAlgebra
using ProgressMeter
using Test