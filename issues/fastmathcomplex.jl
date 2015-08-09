#----------------------------------------------------------------------
# Test name: fastmathcomplex
#
# @fastmath interacted badly with Complex arithmetic, causing a large
# amount of allocation and a corresponding slow down.
# Issue: https://github.com/JuliaLang/julia/issues/12167
# Fixed: https://github.com/JuliaLang/julia/pull/12182
#
# Parameters:
# n         number of times to apply the inner step of the routine
#----------------------------------------------------------------------

using Benchmarks

function bench_fastmathcomplex(n)
    a = 1.0
    b = 1.0
    out = zeros(Complex{Float64}, 1)
    for i in 1:n
        @fastmath out[1] = out[1] * a * b
    end
end

r = @benchmark bench_fastmathcomplex(1_000_000)
println(r)
