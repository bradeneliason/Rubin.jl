using JSON
using DataFrames

fname = "src/rubitests.json"
s = open(fname, "r")
tests  = JSON.parse(s);
# @show length(tests)

## Create a DataFrame from imported json
# NOTE: JSON imported as a vector of Dicts with identical keys
# can't just use DataFrame(tests)
colnames = ["iscomment","steps","integrand","filename" ,"optimal","variable","path"]
df = DataFrame()
for (i,n) in enumerate(colnames)
    col = getindex.(tests, n)
    # println(col |> first |> typeof)
    if first(col) isa String
        col = String.(strip.(col))
    end
    insertcols!(df, i, Symbol(n) => col)
end

# Shorten Path Names
testfile(p) = replace(split(p, "/")[2], ".m" => "")
testgroup(p) = replace(split(p, "/")[3], ".m" => "")
transform!(df, :path => ByRow(testfile) => :testfile)
transform!(df, :path => ByRow(testgroup) => :testgroup)

# first(df, 10)

##
using DelimitedFiles
funcpairs = readdlm("test/funcsubs.csv", ',', String)

# Used a vector of pairs instead of Dict so substitutions can be ordered
funcsubs = Vector{Pair{Any,Any}}()
# funcsubs = Pair.(funcpairs[:,1] ,funcpairs[:,2])
append!(funcsubs, Pair.(funcpairs[:,1] ,funcpairs[:,2]))
sort!(funcsubs, by=x->length(x[1]), rev=true)

mysubs = [
    r"E\^([^\[\]]+)" => s"exp(\1)",
    r"([\)a-z])\s([a-z\(])" => s"\1*\2",    # implicit multiplication
    "[" => "(",
    "]" => ")",
]
append!(funcsubs, mysubs)
funcsubs
## Convert Mathimatica into Julia code
# TODO: fix order of substitutions (eg, replace ArcCoth before Coth)
# TODO: remove version number checking
# TODO: more special functions
#   - ProductLog
#   - Polylog
#   - AppellF1
#   - Hypergeometric2F
function mathimatica2julia(str)
    # replace function names first
    for s in funcsubs
        str = replace(str, s)
    end
    
    # Replace bracketed expressions from inside to out
    # for its = 1:10
    #     str = replace(str, r"\[(^[\[\]]+)\]" => s"(\1)")
    # end
    
    return str
end

##
using SymPy
using ProgressMeter
using DelimitedFiles
const sympy_parsing_mathematica = SymPy.PyCall.pyimport("sympy.parsing.mathematica")
# m2j(s::AbstractString, substitutions::Pair{<:AbstractString,<:AbstractString}...) =
    # SymPy.lambdify_expr(sympy_parsing_mathematica["mathematica"](s, Dict(substitutions...))).args[2]
m2j(s::AbstractString, substitutions::Pair{<:AbstractString,<:AbstractString}...) =
    SymPy.walk_expression(sympy_parsing_mathematica."mathematica"(s, Dict(substitutions...)))

##

m2j_subs = readdlm("test/funcsubs_custom.csv", ',', String)
mathematica = map(s -> s * "[x]", m2j_subs[:,1])
julia = map(s -> s * "(x)", m2j_subs[:,2])
m2j_subs = Pair.(mathematica, julia)
# foo = rand(df[!, :integrand])
# m2j(foo, m2j_subs...)

transform!(df, :integrand => ByRow(x -> !occursin("VersionNumber", x)) => :jiparses)
transform!(df, :optimal => ByRow(x -> !occursin("VersionNumber", x)) => :joparses)
transform!(df, :integrand => :juliaintegrand) # Pass through original
transform!(df, :optimal => :juliaoptimal)  # Pass through original
##
function try_parse(input)
    output = input
    try
        output = m2j(input, m2j_subs...)
        return true, string(output)
    catch
        output *= " # Parse failed"
        return false, output
    end
end

# AsTable([:a, :c]) => ByRow(x ->(2x.a,2x.c)) =>[:a,:c]
transform!(df, :optimal => ByRow(try_parse) => [:joparses, :juliaoptimal])
transform!(df, :integrand => ByRow(try_parse) => [:jiparses, :juliaintegrand])

##
@showprogress for r in eachrow(first(df,50))
    # println(r.jiparses," ", r.joparses)
    if !(r.jiparses && r.joparses)
        r.juliaintegrand *= " # Parse failed"
        r.juliaoptimal *= " # Parse failed"
        continue
    end

    r.jiparses, r.juliaintegrand = try_parse(r.integrand)
    r.joparses, r.juliaoptimal = try_parse(r.optimal)

    println( r.juliaintegrand)
    # try
    #     r.juliaintegrand = m2j(r.integrand, m2j_subs...)
    # catch
    #     r.juliaintegrand *= " # Parse failed"
    #     r.jiparses = false
    # end

    # try
    #     r.juliaoptimal = m2j(r.optimal, m2j_subs...)
    # catch
    #     r.juliaoptimal *= " # Parse failed"
    #     r.joparses = false
    # end
end
first(df,1000).juliaintegrand
first(df,1000).juliaoptimal

##

# transform!(df, :integrand => ByRow(mathimatica2julia) => :juliaintegrand);
# transform!(df, :optimal => ByRow(mathimatica2julia) => :juliaoptimal);
# transform!(df, :integrand => ByRow(x -> m2j(x, m2j_subs...)) => :juliaintegrand);
# transform!(df, :optimal => ByRow(m2j) => :juliaoptimal);
# df[!, :juliaintegrand]
# df[!, :juliaoptimal]

# Parsing Tests 
# function parses(input)
#     occursin("VersionNumber", input) && return false

#     try 
#         Meta.parse(input)
#     catch
#         return false
#     end
#     return true
# end

# transform!(df, :juliaintegrand => ByRow(parses) => :jiparses);
# transform!(df, :juliaoptimal => ByRow(parses) => :joparses);

using CSV
CSV.write("test/conversion_data.csv", df)

## Inspecting failed parses
# Select the rows where parse failures occurred
df_fails = filter(row -> !row.jiparses, df)
# df_fails = filter(row -> !row.joparses, df)
# df_fails = filter(row -> !row.jiparses | !row.joparses, df)
size(df_fails)[1] / size(df)[1]
df_fails.juliaoptimal |> rand
# df_fails.juliaintegrand



## Write a test file =======================================================
fmtfname(fn) = replace(strip(lowercase(fn)), " "=>"_")

gdf = groupby(df, :testfile);

for ((f,), filegroup) in pairs(gdf)
    println("Creating: $(fmtfname(f)).jl")
    test_contents = "using Tests\n\n"

    tsdf = groupby(filegroup, :testgroup);
    for ((s,), testset) in pairs(tsdf)
        println("\t$(size(testset)[1]) \t $s")
        test_contents *= "@testset \"$s\" begin\n" # Begin test set
    
        for t in eachrow(testset)
            p = t.joparses & t.jiparses ? "" : "# "
            i = t[:juliaintegrand]
            v = t[:variable]
            o = t[:juliaoptimal]
            test_contents *= "\t$p@test integrate($i, $v) == :($o)\n"
        end
    
        test_contents *= "end\n\n" # End test set
    end

    write("test/$(fmtfname(f)).jl", test_contents)
end