CI = get(ENV, "CI", nothing) == "true" || get(ENV, "GITHUB_TOKEN", nothing) !== nothing
using DrWatson
@quickactivate "OptMimiDICE2016R2"
using Documenter
using QuantumCitations

# Here you may include files from the source directory
include(srcdir("OptMimiDICE2016R2.jl"))
include(srcdir("optimise.jl"))
include(srcdir("marginaldamage.jl"))

@info "Building Documentation"
bib = CitationBibliography(
    joinpath(@__DIR__, "src", "DICE_Commentary.bib");
    # "/Users/fsch/Documents/PhD/Literature/Literature.bib";
    style=:authoryear)
makedocs(bib;
    sitename = "OptMimiDICE2016R2.jl",
    # This argument is only so that the sequence of pages in the sidebar is configured
    # By default all markdown files in `docs/src` are expanded and included.
    pages = [
        "About the model" => Any["Technicalities" => "index.md", "commentary.md", "reading.md"],
        "Using OptMimiDICE2016R2" => "usage.md",
        "API" => "API.md",
        "References" => "references.md",
        ],
    # Don't worry about what `CI` does in this line.
    format = Documenter.HTML(prettyurls = CI),
    # format = Documenter.LaTeX(),
)

@info "Deploying Documentation"
if CI
    deploydocs(
        # `repo` MUST be set correctly
        repo = "github.com/felixschaumann/OptMimiDICE2016R2.jl.git",
        target = "build",
        push_preview = true,
        devbranch = "main",
    )
end

@info "Finished with Documentation"
