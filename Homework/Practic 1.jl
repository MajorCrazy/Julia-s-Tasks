function gcd(a::Int, b::Int)
    while !iszero(b)
        a, b = b, rem(a, b)
    end
    return abs(a)
end

function gcdx_(a::Int, b::Int)
    # a0, b0 = a, b
    u, v = 1, 0
    u_, v_ = v, u
    while !iszero(b)
        r, k = divrem(a, b)
        a, b = b, r # r = a - k*b0
        u, u_ = u_, u - k * u_
        v, v_ = v_, v - k * v_
    end
    if isnegative(a)
        a, u, v = -a, -u, -v
    end
    return a, u, v
end

isnegative(a::Integer) = (a < 0)


#include("Имя файла.jl")
#print(Имя функции(переменные, если есть))
