#----------------------------------------------------------------------
# Test name: highdimsetindex
#
# The setindex! function is not inlined for higher dimension arrays.
# Issue: https://github.com/JuliaLang/julia/issues/9622
#
# Parameters:
# n         times to set the index
#----------------------------------------------------------------------

using Benchmarks

function bench_highdimsetindex(n)
    A = Array(Float64, (1,1,1,1,1,1,1,1))
    for i in 1:n
        A[1,1,1,1,1,1,1,1] = 1.0
    end
    #=
    Compare with:
    A = Array(Float64, (1,1,1))
    for i in 1:n
        A[1,1,1] = 1.0
    end
    =#
end

r = @benchmark bench_highdimsetindex(10000)
println(r)