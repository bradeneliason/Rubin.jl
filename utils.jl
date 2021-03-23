### TODO - setup a proper build.jl script and not have this script run oon a local git clone of
# TODO extract rules form symja?

#https://github.com/RuleBasedIntegration/Rubi
#julia> add_artifact!("Artifacts.toml", "Rubi", "https://github.com/RuleBasedIntegration/Rubi/archive/4.16.1.0.tar.gz", force=true)

#https://github.com/RuleBasedIntegration/MathematicaSyntaxTestSuite
#
#julia> add_artifact!("Artifacts.toml", "RubiTests", "https://github.com/RuleBasedIntegration/MathematicaSyntaxTestSuite/archive/4.16.0.tar.gz", force=true)
#julia> Pkg.instantiate()
using Rubin
using Artifacts
using FileTrees
using JSON3
using Test

# How to test artifact is properly installed?
#@test run(`ls $(artifact"Rubi")`)
#Pkg.Artifacts.ensure_artifact_installed("Rubi", "Artifacts.toml")
#OR
#Pkg.Artifacts.artifact_exists(hash::SHA1)
#@test run(`ls $(artifact"RubiTests")`)
rubi = artifact"Rubi"
rubitests = artifact"RubiTests"
run(`ls $rubi`)

#0 Design goals:
#1. read Rules into a huge JSON array (with FileTrees.jl)
#2. Add metadata, facts, number, filename
#3. save to a single file

# Steps:
# 1. Read artifact dir into a FileTree
rubidir = FileTree(rubi)

# 2. Come up with a function to parse the files
# INPUT examples:
#(* ::Subsection::Closed:: *)
#(* 1.1.1.1 (a+b x)^m *)
#Int[1/x_, x_Symbol] := Log[x]
#Int[x_^m_., x_Symbol] := x^(m + 1)/(m + 1) /; FreeQ[m, x] && NeQ[m, -1]
# (Int[...]) := (...) /; (...)
# ^ lhs          ^rhs     ^facts
# BUT we can also have
# ...
# (* Int[Sqrt[a_.+b_.*x_]*(A_.+B_.*x_)/(Sqrt[c_.+d_.*x_]*Sqrt[e_.+f_.*x_ ]*Sqrt[g_.+h_.*x_]),x_Symbol] :=  B*Sqrt[a+b*x]*Sqrt[e+f*x]*Sqrt[g+h*x]/(f*h*Sqrt[c+d*x]) - B*(b*g-a*h)/(2*f*h)*Int[Sqrt[e+f*x]/(Sqrt[a+b*x]*Sqrt[c+d*x]*Sqrt[g+ h*x]),x] + B*(d*e-c*f)*(d*g-c*h)/(2*d*f*h)*Int[Sqrt[a+b*x]/((c+d*x)^(3/2)*Sqrt[ e+f*x]*Sqrt[g+h*x]),x] /; FreeQ[{a,b,c,d,e,f,g,h,A,B},x] &&  EqQ[2*A*d*f-B*(d*e+c*f),0] *)
# (* Int[...] := (...) ;/ (...) *)
# ^comment syntax around lhs := rhs ;/ facts *) closing comment syntax
# Which means we have 2 grammars:
# Case 1:
# (^Int.?) := (.+) /; (.+)
# Case 2:
# (* (Int.?) := (.+)(|\/; (.+)) 
#
#
# SOLUTION:
# With the help of Regex101.com:
# (Int.+) := (.+)(|\/; (.+))
# ^glob lhs,
#             ^glob rhs
#                  ^glob facts, if any exist
# REMEMBER: Add a marker if test is commented

regextest = [
"""(* ::Subsection::Closed:: *)""",
"""(* 1.1.1.1 (a+b x)^m *)""",
"""Int[1/x_, x_Symbol] := Log[x]""",
"""(* Int[Sqrt[a_.+b_.*x_]*(A_.+B_.*x_)/(Sqrt[c_.+d_.*x_]*Sqrt[e_.+f_.*x_ ]*Sqrt[g_.+h_.*x_]),x_Symbol] :=  B*Sqrt[a+b*x]*Sqrt[e+f*x]*Sqrt[g+h*x]/(f*h*Sqrt[c+d*x]) - B*(b*g-a*h)/(2*f*h)*Int[Sqrt[e+f*x]/(Sqrt[a+b*x]*Sqrt[c+d*x]*Sqrt[g+ h*x]),x] + B*(d*e-c*f)*(d*g-c*h)/(2*d*f*h)*Int[Sqrt[a+b*x]/((c+d*x)^(3/2)*Sqrt[ e+f*x]*Sqrt[g+h*x]),x] /; FreeQ[{a,b,c,d,e,f,g,h,A,B},x] &&  EqQ[2*A*d*f-B*(d*e+c*f),0] *)""",
"""(* Int[1/(a_+b_.*x_^5),x_Symbol] := With[{r=Numerator[Rt[a/b,5]],  s=Denominator[Rt[a/b,5]]}, r/(5*a)*Int[1/(r+s*x),x] + 2*r/(5*a)*Int[(r-1/4*(1-Sqrt[5])*s*x)/(r^2-1/2*(1-Sqrt[5])*r*s*x+s^ 2*x^2),x] + 2*r/(5*a)*Int[(r-1/4*(1+Sqrt[5])*s*x)/(r^2-1/2*(1+Sqrt[5])*r*s*x+s^ 2*x^2),x]] /; FreeQ[{a,b},x] && PosQ[a/b] *)""",
"""(* Int[1/Sqrt[a_+b_.*x_^3],x_Symbol] := With[{q=Rt[b/a,3]}, -Sqrt[2]*(1+Sqrt[3])*(1+Sqrt[3]+q*x)^2*Sqrt[(1+q^3*x^3)/(1+Sqrt[3]+ q*x)^4]/(3^(1/4)*q*Sqrt[a+b*x^3])* EllipticF[ArcSin[(-1+Sqrt[3]-q*x)/(1+Sqrt[3]+q*x)],-7-4*Sqrt[3]]]  /; FreeQ[{a,b},x] && PosQ[a] *)""",
"""(* Int[Sqrt[c_+d_.*x_^2]/((a_+b_.*x_^2)*Sqrt[e_+f_.*x_^2]),x_Symbol] :=   Sqrt[c+d*x^2]*Sqrt[c*(e+f*x^2)/(e*(c+d*x^2))]/(a*Rt[d/c,2]*Sqrt[e+f* x^2])* EllipticPi[1-b*c/(a*d),ArcTan[Rt[d/c,2]*x],1-c*f/(d*e)] /;  FreeQ[{a,b,c,d,e,f},x] && PosQ[d/c] *)"""]
intrulesregexfacts = r"(Int.+) := (.+) \/; (.+)( \*\))?"
intrulesregexsimple = r"^(Int.+) := (.+)"

vregex = match.(intrulesregexsimple, regextest)
rulesregex = match.(intrulesregexfacts, regextest)
@test isnothing(vregex[1])
@test isnothing(vregex[2])
@test vregex[3].captures[1] == "Int[1/x_, x_Symbol]"
@test vregex[3].captures[2] == "Log[x]"
@test vregex[3].captures[3] == ""
@test rulesregex[end].captures[end] == " FreeQ[{a,b,c,d,e,f},x] && PosQ[d/c]"

# OK, so now we can jam everything into a JSON thingy.
# We want to include the 
# pathname: string
# filename: string
# rulenumber: Int
# commented: bool
# lhs: string
# rhs: string
# givens (not atomized)
Base.@kwdef struct IntRuleCapture
	pathname::String = ""
	filename::String = ""
	rulenumber::Int = ""
	comment::Bool = true
	rhs::String = ""
	lhs::String = ""
	givens::String	 = ""
end
testcapture = """Int[(c_.*x_)^m_.*(a1_ + b1_.*x_^n_)^p_*(a2_ + b2_.*x_^n_)^p_, x_Symbol] := Int[(c*x)^m*(a1*a2 + b1*b2*x^(2*n))^p, x] /; FreeQ[{a1, b1, a2, b2, c, m, n, p}, x] && EqQ[a2*b1 + a1*b2, 0] && (IntegerQ[p] || GtQ[a1, 0] && GtQ[a2, 0])"""

lhs(cap::RegexMatch) = cap.captures[1]
rhs(cap::RegexMatch) = cap.captures[2]
givens(cap::RegexMatch) = cap.captures[3]
iscommented(cap::RegexMatch) = startswith(cap.captures[1], '(')

# Input: A file
# Output: An array of structs like IntRuleCapture
# TODO: Figure out rule numbers
function intrulesfileparser(file, regex)
	caps = [i for i in match.(regex, readlines(file)) if !isnothing(i)]
	vlhs = lhs.(caps)
	vrhs = rhs.(caps)
	vgivens = givens.(caps)
	vcomments = iscommented.(caps)
	path = relpath(file, rubi) # Fix this global?
	[IntRuleCapture(pathname = path, filename = splitpath(file)[end], rulenumber = 0, lhs = vlhs[i], rhs = vrhs[i], givens = vgivens[i], comment = vcomments[i]) for i in 1:length(caps)]
end

# 3. Lazy load the files
intfiles = rubidir["Rubi-4.16.1.0/Rubi/IntegrationRules"]
parsedstructs = FileTrees.load(intfiles) do file
	intrulesfileparser(string(path(file)), intrulesregexfacts)
end

vstructs = reducevalues(vcat, parsedstructs)
@test 7032 == length(vstructs)

using JSON3, StructTypes
# Defining this straight from the JSON3 documentation
# hat tip to Jacob Quinn and the #data gang
StructTypes.StructType(::Type{IntRuleCapture}) = StructTypes.Struct()
json = JSON3.write(vstructs)

# We can also just use JSON
# JSON.json(vstructs)
targetpath = joinpath(pkgdir(Rubin), "src", "intrules.json")

# YASSS WRITE IT
open(targetpath, "w") do f
	JSON3.pretty(f, JSON3.write(vstructs))
	println(f)
end

# GOALS!
#1. read MathematicaSyntaxTEstSuite into a huge JSON ArraY
#2. Add metadata, facts, number, filename, test number
#3. save to a single file.
inttests = 
["""{x^m*SinhIntegral[a + b*x], x, 1, -((b*CannotIntegrate[(x^(1 + m)*Sinh[a + b*x])/(a + b*x), x])/(1 + m)) + (x^(1 + m)*SinhIntegral[a + b*x])/(1 + m)}""",
"""{x^3*SinhIntegral[a + b*x], x, 14, (a*Cosh[a + b*x])/(2*b^4) + (a^3*Cosh[a + b*x])/(4*b^4) - (3*x*Cosh[a + b*x])/(2*b^3) - (a^2*x*Cosh[a + b*x])/(4*b^3) + (a*x^2*Cosh[a + b*x])/(4*b^2) - (x^3*Cosh[a + b*x])/(4*b) + (3*Sinh[a + b*x])/(2*b^4) + (a^2*Sinh[a + b*x])/(4*b^4) - (a*x*Sinh[a + b*x])/(2*b^3) + (3*x^2*Sinh[a + b*x])/(4*b^2) - (a^4*SinhIntegral[a + b*x])/(4*b^4) + (1/4)*x^4*SinhIntegral[a + b*x]}""",
"""{x^2*SinhIntegral[a + b*x], x, 10, -((2*Cosh[a + b*x])/(3*b^3)) - (a^2*Cosh[a + b*x])/(3*b^3) + (a*x*Cosh[a + b*x])/(3*b^2) - (x^2*Cosh[a + b*x])/(3*b) - (a*Sinh[a + b*x])/(3*b^3) + (2*x*Sinh[a + b*x])/(3*b^2) + (a^3*SinhIntegral[a + b*x])/(3*b^3) + (1/3)*x^3*SinhIntegral[a + b*x]}""",
"""{x^1*SinhIntegral[a + b*x], x, 7, (a*Cosh[a + b*x])/(2*b^2) - (x*Cosh[a + b*x])/(2*b) + Sinh[a + b*x]/(2*b^2) - (a^2*SinhIntegral[a + b*x])/(2*b^2) + (1/2)*x^2*SinhIntegral[a + b*x]}""",
"""{x^0*SinhIntegral[a + b*x], x, 1, -(Cosh[a + b*x]/b) + ((a + b*x)*SinhIntegral[a + b*x])/b}""",
"""{SinhIntegral[a + b*x]/x^1, x, 0, CannotIntegrate[SinhIntegral[a + b*x]/x, x]}""",
"""{SinhIntegral[a + b*x]/x^2, x, 7, (b*CoshIntegral[b*x]*Sinh[a])/a + (b*Cosh[a]*SinhIntegral[b*x])/a - (b*SinhIntegral[a + b*x])/a - SinhIntegral[a + b*x]/x}""",
"""{SinhIntegral[a + b*x]/x^3, x, 11, (b^2*Cosh[a]*CoshIntegral[b*x])/(2*a) - (b^2*CoshIntegral[b*x]*Sinh[a])/(2*a^2) - (b*Sinh[a + b*x])/(2*a*x) - (b^2*Cosh[a]*SinhIntegral[b*x])/(2*a^2) + (b^2*Sinh[a]*SinhIntegral[b*x])/(2*a) + (b^2*SinhIntegral[a + b*x])/(2*a^2) - SinhIntegral[a + b*x]/(2*x^2)}"""];

"""
 Sample input: {Sqrt[2*x + 1], x,   1, (1/3)*(1 + 2*x)^(3/2)}
               ^query		    ^var ^steps      ^optimal answer
# NOTE: 
grep '\(\* \{' | wc detects 284 commented cases at time of writing

"""
Base.@kwdef struct IntRuleTest
	integrand::String = ""
	variable::String = ""
	steps::Int = 1
	optimalanswer::String = ""
	comment::Bool = false
end

# Note: They claim 72944 tests total in the website, but we must care about the ones that are commented
# header: string - to print testset and @async regions
# tests: Vec{IntRuleTest} - to write all the tests
Base.@kwdef struct IntRuleTestSection
	filename::String = ""
	path::String = ""
	header::String = ""
	tests::Vector{IntRuleTest} = IntRuleTest[]
end

"""
 1. Find first line that is not `skipme`, parse and push into the header
 2. Slurp the subsequent integrals, capture them into a vector of `IntRuleTest`s
 3. When you encounter a header that is different from the previous, put 
		all the previous IntRuleTests into a `IntTestSectionCapture` array
	Headers: There is much metadata like `(* n > 0 *)` and `(*Integrands ... )`
	We don't wanna throw that away if possible
# TODO: finer metadata with the headers in the file
So that testset nesting can happen
"""
function inttestfileparser(file)
	inttestregex = r"{(.+),(.+),(.+),(.+)}"
	# TODO add nesting to subsubsections
	headerregex = r"\(\*(.+)\*\)"
	header = ""
	vtests = IntRuleTest[]
	vsections = IntRuleSections[]
	for line in readlines(file)
		isempty(line) && continue	
		# Skip the `(* ::Subsection...` and `(* ::Subsubsection...` lines
		startswith(line, "(* ::") && continue

		# We know here there are only integral line captures
		# OR they are headers
		# Need to know which
		# Need to know if line capture is commented

		# By inspection, if the line does NOT contains '{' or '}', it must be
		# A header
		# INVARIANT: All inttests are preceded by a header
		if !occursin(r"{|}", line)
			m = match(headerregex, line)
			header = m.captures[1] 
			if header
			continue
		else
			# We know it's a inttest now, let's capture it
			# and push it into the vec
			m = match(inttestregex, line)
			comment = startswith(line, "(* {")
			push!(v, IntRuleTest(
		end
	end
	v
end
			




headerregex = r"\(\*(.+)\*\)"
@test match(headerregex, "(*Integrands of the form x^m PolyLog[n, a x^q]*)").captures[1] == "Integrands of the form x^m PolyLog[n, a x^q]"



#AFTER the parse and dump:
#Construct Mathematica to Julia rewriter?
#
# builtin reading/writing
# JSON3.read(json_string)
# JSON3.write(x)

# custom types
# JSON3.read(json_string, T; kw...)
# JSON3.write(x)
# builtin reading/writing
# JSON3.read(json_string)
# JSON3.write(x)
#
# # custom types
# JSON3.read(json_string, T; kw...)
# JSON3.write(x)
#
# More complicated
#
# # custom types: incrementally update a mutable struct
# x = T()
# JSON3.read!(json_string, x; kw...)
# JSON3.write(x)
#
# # read from file
# json_string = read("my.json", String)
# JSON3.read(json_string)
# JSON3.read(json_string, T; kw...)
#
# # write to file
# open("my.json", "w") do f
#     JSON3.write(f, x)
#         println(f)
#         end
#
#         # write a pretty file
#         open("my.json", "w") do f
#             JSON3.pretty(f, JSON3.write(x))
#                 println(f)
#                 end


# custom types: incrementally update a mutable struct
# x = T()
# JSON3.read!(json_string, x; kw...)
# JSON3.write(x)

# read from file
# json_string = read("my.json", String)
# JSON3.read(json_string)
# JSON3.read(json_string, T; kw...)

# write to file
# open("my.json", "w") do f
    # JSON3.write(f, x)
    # println(f)
# end

# write a pretty file
# open("my.json", "w") do f
    # JSON3.pretty(f, JSON3.write(x))
    # println(f)
# end
