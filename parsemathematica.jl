# TODO:
#   - Parsing factorials

#  https://github.com/sympy/sympy/blob/master/sympy/parsing/mathematica.py
"""
    mathematica2julia(s, additional_translations=[])

Converts a Mathematica expression string into a Julia string
"""
function mathematica2julia(s, additional_translations=[])
    # TODO: do creation of translations automatically??
    # TODO: test additional inputs

    checkinput(s)                       # Checking bracket pairs

    # Preprocessing
    s = applyrule(s, "implicitmult")    # uncover '*' hiding behind a whitespace
    s = applyrule(s, "whitespace")      # remove whitespace(s)
    s = applyrule(s, "add*_1")          # add omitted '*' character
    s = applyrule(s, "add*_2")          # add omitted '*' character

    s = replace(s, "!"=>"")
    
    try
        s = convertfunction(s)              # translate function
    catch
        @warn "Parse error on:\n$s"
        s = ""
    end
    
    s = applyrule(s, "Pi")              # Replace Pi with π 
    s = applyrule(s, "I")               # Replace I with im
    
    return Meta.parse(s)
    # return s # Return a string or expression??
end

################################################################################
##                                                                            ##
#                     Creating a Translation Table                             #
#                                                                              #
################################################################################

Base.@kwdef struct JuliaTranslation
    fn::String = ""
    args::Vector{String} = []
    pat::Regex
end

"""
    JuliaTranslation(p::Pair)

Takes a Pair type which maps a Mathematica function to a Julia function and 
creates a translation object to aid with function mapping.

Sample input: Log[x,y] => log(y,x)

# Fields:
 * `fn` Julia function name (eg, `log(y,x)`)
 * `args` arguments of the Julia function (eg, `["x", "y"]``)
 * `pat` pattern to match the arguments (eg, r"(?:\A|(?<=[^a-zA-Z]))(?:(x|y))(?=[^a-zA-Z])"))
"""
function JuliaTranslation(p::Pair)
    # s,j = p
    m = match(matfuncregex, p[1])
    args, _ = get_args(p[1], m)
    
    # convert '*x' to '\\*x' for regex
    re_args = replace.(args, "*"=>"\\*")
    xyz = "(?:(" * join(re_args, "|") * "))"
    
    # Template for argument pattern
    argpatregex = "(?:\\A|(?<=[^a-zA-Z]))$xyz(?=[^a-zA-Z])"
    pat = Regex(argpatregex)
    JuliaTranslation(p[2], args, pat)
end

# TODO: docs
"""
createtranslations(d::Dict)

Creates a dictionary where the keys are tuples of Mathematica functions and 
their argument numbers (eg, "("Log", 2)"). The values of the dictionary are
JuliaTranslation types.
"""
function createtranslations(d::Dict)
    translations = Dict()
    for pair in d
        m = match(matfuncregex, pair[1])    # Match of Mathematica function
        jt = JuliaTranslation(pair)         # Create JuliaTranslation from pair
        key = (m.match, length(jt.args))    # Create a key from func and argnum
        push!(translations, key => jt)      # Push to dict
    end
    translations
end

################################################################################
##                                                                            ##
#                          Conversion Functions                                #
#                                                                              #
################################################################################

"""
    checkinput(s)

Checks to make sure that brackets are matched
"""
function checkinput(s)
    for bracket in [("[", "]"), ("{", "}"), ("(", ")")]
        if count(bracket[1], s) != count(bracket[2], s)
            @error "'$s' function form is invalid."
        end
    end
end

# TODO: Make this a mutating function
"""
    applyrule(s, rulename)

Applies a rule by name from a dictionary called rules
"""
function applyrule(s, rulename)
    pat, sub = rules[rulename]
    replace(s, pat => sub)
end

"""
    convertfunction(s)

Parse Mathematica function to SymPy one
"""
function convertfunction(s)
    scanned = ""                # converted string
    cur = 0                     # position cursor
    while true
        m = match(matfuncregex, s)
        
        if isnothing(m)
            # append the rest of string
            scanned *= s
            break
        end
        
        fm = m.match    # get Mathematica function name
        bgn = m.offset  # the start position of fm function

        # get arguments, and the end position of fm function
        args, stop = get_args(s, m)

        # convert Mathematica function to SymPy one
        s = convert_one_function(s, fm, args, bgn, stop)
        
        cur = bgn               # update cursor
        scanned *= s[1:cur-1]   # append converted part
        s = s[cur:end]          # shrink s
    end

    return scanned
end

# Create a new enumerate function which takes a variable start number
Base.enumerate(iter, start=1) = zip(Iterators.countfrom(start), iter)

# TODO: simplify
# TODO: write tests
"""
    get_args(s, m)

Get arguments of a Mathematica function
"""
function get_args(s, m)
    anc = m.offset + length(m.match) + 1 # pointing the first letter of arguments
    square, curly = [], []              # stack for brakets
    args = String[]
    # args = ""

    # current cursor
    cur = anc
    j = 0
    for (i, c) in enumerate(s[anc:end], anc)
        # extract one argument
        if c == ',' && isempty(square) #&& (!isempty(curly))
            push!(args, s[cur:i-1])       # add an argument
            cur = i + 1                   # move cursor
        end

        # # handle list or matrix (for future usage)
        if c == '{'
            append!(curly, c)
        elseif c == '}'
            pop!(curly)
        end

        # # seek corresponding ']' with skipping irrevant ones
        if c == '['
            append!(square, c)
        elseif c == ']'
            if !isempty(square)
                pop!(square)
            else
                push!(args, s[cur:i-1])
                break
            end
        end
        j = i
    end

    # the next position to "]" bracket (the function end)
    func_end = j + 1

    args, func_end
end

"""
    convert_one_function(s, fm, args, bgn, stop)

Inputs:
 * `s`     The entire string to be matched
 * `fm`    The Mathematica function
 * `args`  A list of arguments
 * `bgn`   The location in the string, s, where the function, fm, begins
 * `stop`  The location in the string, s, where the function, fm, ends

 Converts the first functions it see into Julia function
"""
function convert_one_function(s, fm, args, bgn, stop)
    # Function is in translations with the number of arguments
    if (fm, length(args)) in keys(translations)
        key = (fm, length(args))

        # x, y,... model arguments
        x_args = translations[key].args

        # make CORRESPONDENCES between model arguments and actual ones
        d = Dict(k => v for (k, v) in zip(x_args, args))
        
    # with variable-length argument
    # TODO: Implements variable-length arguments, perhaps with splatting
    elseif (fm, '*') in keys(translations)
        key = (fm, '*')
        
        # x, y,..*args (model arguments)
        x_args = translations[key].args
        
        # make CORRESPONDENCES between model arguments and actual ones
        d = Dict()
        for (i, x) in enumerate(x_args)
            if x[0] == '*'
                d[x] = join(args[i:end], ",")
                break
            end
            d[x] = args[i]
        end
    else    # The function is not in translations
        @error "$fm with $(length(args)) arguments is not in translations pairs."
    end

    template = translations[key].fn    # template string of converted function
    pat = translations[key].pat        # regex pattern for x_args

    scanned = ""
    cur = 0
    while true
        m = match(pat, template)
        
        if isnothing(m)
            scanned *= template
            break
        end

        x = m.match         # get model argument
        xbgn = m.offset - 1 # get a start position of the model argument

        # add the corresponding actual argument
        scanned *= template[1:xbgn] * d[x]

        # update cursor to the end of the model argument
        cur = m.offset + length(m.match) 

        # shrink template
        template = template[cur:end]
    end

    # update to swapped string
    return s[1:bgn-1] * scanned * s[stop+1:end]
end

################################################################################
##                                                                            ##
#                          Default Dictionaries and Rules                      #
#                                                                              #
################################################################################
replacements = Dict(
    " " => "",
    "{" => "[",
    "}" => "]",
)

# Default dictionary of rules
rules = Dict(
    # a single whitespace to "*"
     "implicitmult" => (r"""
            (?<=[a-zA-Z\d])     # a letter or a number
            \                   # a whitespace
            (?=[a-zA-Z\d])      # a letter or a number
            """x,
            "*"),

    # Remove whitespace
    "whitespace" => (" ", ""),
    
    # add omitted "*" character
    "add*_1" => (r"""
            (?<=[])\d])         # ], ) or a number
                                # ""
            (?=[(a-zA-Z])       # ( or a single letter
            """x, 
            "*"),

    # add omitted "*" character (variable letter preceding)
    "add*_2" => (r"""
            (?<=[a-zA-Z])       # a letter
            \(                  # ( as a character
            (?=.)               # any characters
            """x, 
            "*("),

    # convert "Pi" to "π"
    "Pi" => (r"""
    (?:
    \A|(?<=[^a-zA-Z])
    )
    Pi                  # "Pi" is 3.14159... in Mathematica
    (?=[^a-zA-Z])
    """x, 
    "π"),
    
    # convert "I" to "im"
    "I" => (r"""
            (?:
            \A|(?<=[^a-zA-Z])
            )
            I                  # "Pi" is 3.14159... in Mathematica
            (?=[^a-zA-Z])
            """x, 
            "im"),
    )

matfuncregex = r"""
(?:
\A|(?<=[^a-zA-Z])   # at the top or a non-letter
)
[A-Z][a-zA-Z\d]*    # Function
(?=\[)              # [ as a character
"""x

# list or matrix pattern (for future usage)
matargsregex = r"\{.*\}"


#  TODO: perhaps manually write many more correspondences
correspondences = Dict(
    "Sqrt[x]" => "sqrt(x)",
    "Exp[x]" => "exp(x)",
    "Log[x]" => "log(x)",
    "Log[x,y]" => "log(y,x)",
    "Log2[x]" => "log(x,2)",
    "Log10[x]" => "log(x,10)",
    "Mod[x,y]" => "mod(x,y)",
    "Max[*x]" => "Max(*x)",
    "Min[*x]" => "Min(*x)",
    "Pochhammer[x,y]" =>"rf(x,y)",
    "ArcTan[x,y]" =>"atan2(y,x)",
    "ExpIntegralEi[x]" => "Ei(x)",
    "SinIntegral[x]" => "Si(x)",
    "CosIntegral[x]" => "Ci(x)",
    "AiryAi[x]" => "airyai(x)",
    "AiryAiPrime[x]" => "airyaiprime(x)",
    "AiryBi[x]"  =>"airybi(x)",
    "AiryBiPrime[x]"  =>"airybiprime(x)",
    "LogIntegral[x]" =>"li(x)",
    "PrimePi[x]" => "primepi(x)",
    "Prime[x]" => "prime(x)",
    "PrimeQ[x]" => "isprime(x)",
);

# Adds trig functions to the correspondences programmatically
triprefixes = ["", "Arc"]
trifunctions = ["Sin", "Cos", "Tan", "Cot", "Sec", "Csc"]
trisuffixes = ["", "h"]
for p in triprefixes, f in trifunctions, s in trisuffixes
    fm = "$p$f$s[x]"
    fs = length(p) > 0 ? "a$(lowercase(f))$s(x)" : "$(lowercase(f))$s(x)"
    push!(correspondences, fm => fs)
end

################################################################################
##                                                                            ##
#                                   Testing                                    #
#                                                                              #
################################################################################

using Test

translations = createtranslations(correspondences)

@testset "Replacement Rules" begin
    @test applyrule("2 x", "implicitmult") == "2*x"
    @test applyrule("(1 + 2)", "whitespace") == "(1+2)"
    @test applyrule("(1+2)x", "add*_1") == "(1+2)*x"
    @test applyrule("x(1+2)", "add*_2") == "x*(1+2)"
    @test applyrule("Sin[Pi]", "Pi")  == "Sin[π]"

    s = "Sqrt[x] + 2 x + 3 (1 + 3) + (2 + 4) d"
    s = applyrule(s, "implicitmult")    # uncover '*' hiding behind a whitespace
    s = applyrule(s, "whitespace")      # remove whitespace(s)
    s = applyrule(s, "add*_1")          # add omitted '*' character
    s = applyrule(s, "add*_2")          # add omitted '*' character
    @test s == "Sqrt[x]+2*x+3*(1+3)+(2+4)*d"
end;

# @testset "Translation" begin
#     @test mathematica2julia("Sqrt[x]") == "sqrt(x)"
#     @test mathematica2julia("ArcTan[x,y]") == "atan2(y,x)"
#     @test mathematica2julia("Sin[Cos[x]]") == "sin(cos(x))"
#     @test mathematica2julia("Sin[Cos[Pi]]") == "sin(cos(π))"
#     @test mathematica2julia("Sqrt[x] + 2 x + 3 (1 + 3) + (2 + 4) d") == "sqrt(x)+2*x+3*(1+3)+(2+4)*d"
#     @test mathematica2julia("2*I*Sqrt[2]") == "2*im*sqrt(2)"
# end;
@testset "Translation" begin
    @test mathematica2julia("Sqrt[x]") == :(sqrt(x))
    @test mathematica2julia("ArcTan[x,y]") == :(atan2(y,x))
    @test mathematica2julia("Sin[Cos[x]]") == :(sin(cos(x)))
    @test mathematica2julia("Sin[Cos[Pi]]") == :(sin(cos(π)))
    @test mathematica2julia("Sqrt[x] + 2 x + 3 (1 + 3) + (2 + 4) d") == :(sqrt(x)+2*x+3*(1+3)+(2+4)*d)
    @test mathematica2julia("2*I*Sqrt[2]") == :(2*im*sqrt(2))
end;

################################################################################
##                                                                            ##
#                              Benchmarking                                    #
#                                                                              #
################################################################################

using BenchmarkTools
using SymPy
using DelimitedFiles

const sympy_parsing_mathematica = SymPy.PyCall.pyimport("sympy.parsing.mathematica")
m2j(s::AbstractString, substitutions::Pair{<:AbstractString,<:AbstractString}...) =
SymPy.walk_expression(sympy_parsing_mathematica."mathematica"(s, Dict(substitutions...)))

m2j_subs = [r[1] => r[2] for r in  eachrow(readdlm("func_subs.csv", ';', String))]

function m2j(s::AbstractString; verbose=false)
	try
		return m2j(s, m2j_subs...)
	catch
		verbose && @warn "Couldn't parse:\n$(s)\n"
		return "Parse Error"
	end	
end

##
@btime m2j("Csc[x + Sin[x]]") # 768.100 μs (964 allocations: 50.62 KiB)
@btime mathematica2julia("Csc[x + Sin[x]]") # 12.300 μs (131 allocations: 6.73 KiB)

@btime m2j("(2*I*Sqrt[2]*Log[Pi/4 - (I*x)/2, 2] * Sqrt[Sinh[x]])/Sqrt[I*Sinh[x]]") # 2.592 ms (3137 allocations: 175.34 KiB)
@btime mathematica2julia("(2*I*Sqrt[2]*Log[Pi/4 - (I*x)/2, 2] * Sqrt[Sinh[x]])/Sqrt[I*Sinh[x]]") # 28.300 μs (380 allocations: 20.55 KiB)

## Running on many functions
using JSON3

# Load a list of Expression Pairs
m2j_subs = Dict(r[1] => r[2] for r in  eachrow(readdlm("func_subs.csv", ';', String)))
translations = createtranslations(m2j_subs)

fname = joinpath("src", "rubitests.json")
tests_str = read(fname, String);
tests = JSON3.read(tests_str);

ints = [t.integrand for t in tests];    # Extract all the integrands
@show length(ints)

num = 1000
sample_exprs = rand(ints, num)
@time mathematica2julia.(sample_exprs);
@time m2j.(sample_exprs);

print("")

################################################################################
##                                                                            ##
#                              Experiments                                     #
#                                                                              #
################################################################################

m2j_subs = Dict(r[1] => r[2] for r in  eachrow(readdlm("func_subs.csv", ';', String)))
translations = createtranslations(m2j_subs)

@time jints =  mathematica2julia.(ints);    # 15x faster
# 12.475728 seconds (9.21 M allocations: 486.123 MiB, 2.47% gc time)

##
@time jints2 =  m2j.(ints);
# 196.246567 seconds (196.29 M allocations: 10.434 GiB, 3.02% gc time, 0.25% compilation time)
##


s = "(a + b*x)!^n*PolyGamma[0, 1 + a + b*x]"
mathematica2julia(s)
s = "Sec[a + b*x]^2*F[c, d, Tan[a + b*x], r, s]"
mathematica2julia(s)

##
["""("$(k[1])", $(k[2]))""" for k in keys(translations)] |> sort .|> println;

translations[("F", 5)]