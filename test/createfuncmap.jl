# Eventually replace with handmade file
using CSV
using SpecialFunctions

## Create function substitution pairs automatically
subs = [
    "arc" => "a",
]
function naiverename(input)
    output = lowercase(input)
    for s in subs
        output = replace.(output, s)
    end
    output
end


funcs_m = readlines("mathematicafunctions2.txt")
funcs_m  = replace.(funcs_m, "["=> "")
juliafuncnames = string.(sort([names(Base); names(SpecialFunctions)]))

funcs_matched = filter(fm -> naiverename(fm) in juliafuncnames, funcs_m)
funcs_notmatched = filter(fm -> !(naiverename(fm) in juliafuncnames), funcs_m)
# println.(funcs_notmatched);

funcsubs = [replace(m, "["=> "") => naiverename(m) for m in funcs_matched]
CSV.write("test/funcsubs.csv", funcsubs, writeheader=false)
