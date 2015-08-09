#----------------------------------------------------------------------
# Test name: iobufferread
#
# Measures time to read from an IOBuffer one line at a time.
# Issue: https://github.com/JuliaLang/GZip.jl/pull/32
# Fixed: https://github.com/JuliaLang/julia/pull/12364
#
# Parameters:
# n         log10 size of the buffer
#----------------------------------------------------------------------

using Benchmarks

function bench_iobufferread(n)
    io = IOBuffer(randstring(10^n))
    f(io) = (seek(io, 0); x = 0; while !eof(io); x += read(io, UInt8); end)
    r = @benchmark f(io)
end

r = bench_iobufferread(8)
println(r)