#----------------------------------------------------------------------
# Test name: replace
#
# Replace was allocating excessive memory.
# Issue: https://github.com/JuliaLang/julia/issues/11856
# Fixed: https://github.com/JuliaLang/julia/pull/11898
#
# Parameters:
# n         log10 size of the string to search through
#----------------------------------------------------------------------

using Benchmarks

function bench_replace(n)
    s = lowercase(randstring(10^n))
    r = @benchmark replace(s,"a","b")
end

r = bench_replace(8)
println(r)