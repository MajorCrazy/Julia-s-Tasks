function gcd(a::T, b::T) where T 
    while !iszero(a)
        a, b = b, rem(a, b)
    end
    return a < 0 ? -aT : a
end

function gcdx_(a::T, b::T) where T
    a0, b0 = a, b
    u, v = one(T), zero(T)
    u_, v_ = v, u
    while !iszero(b)
        r, k = remdiv(a, b)
        a, b = b, r # r = a - k*b0
        u, u_ = u_, u-k*u_
        v, v_ = v_, v-k*v_
    end
end
