# 1. Функция, вычисляющую НОД двух чисел (или многочленов)

function gcd(a::Int, b::Int)
    while !iszero(b)
        a, b = b, rem(a, b)
    end
    return abs(a)
end

# 2. Функция, реализующая расширенный алгоритм Евклида, вычисляющий не только НОД, но и коэффициенты его линейного представления

function gcdx_(a::Int, b::Int)
    # a0, b0 = a, b
    u, v = 1, 0
    u_, v_ = v, u
    while !iszero(b)
        r, k = rem(a, b), div(a, b)
        a, b = b, r # r = a - k*b0
        u, u_ = u_, u - k * u_
        v, v_ = v_, v - k * v_
    end
    if isnegative(a)
        a, u, v = -a, -u, -v
    end
    return a, u, v
end
# 3. С использованием функции gcdx_ реаализовать функцию invmod_(a::T, M::T) where T, 
# которая бы возвращала бы обратное значение инвертируемого элемента (a) кольца вычетов по модулю M, а для необращаемых элементов возвращала бы nothing.

function invmod_(a::Int, M::Int)
    if gcd(a::Int, M::Int) != 1
        return nothing
    else
        return gcdx_(a::Int, M::Int)
    end
end

function diaphant_solve(a::Int,b::Int,c::Int)
    if mod(c, gcd(a,b)) != 0
        return nothing
    end
    return gcdx_(a, b)[2:3]
end

# 5. Для вычислений в кольце вычетов по модулю M определить специальный тип и определить для этого типа следующие операци и функции:
# +, -, унарный минус, *, ^, inverse (обращает обратимые элементы), display (определяет, в каком виде значение будет выводиться в REPL)

struct Residue{T, M}
    a::T where{T<:Int64}
    Residue{T, M}(a) where{T<:Int64, M} = new(mod(a, M))
end


Base. +(a::Residue{T,M}, b::Residue{T,M}) where {T<:Int64, M} = Z{T,M}(a.a+b.a)
Base. -(a::Residue{T,M}, b::Residue{T,M}) where {T<:Int64, M} = Z{T,M}(a.a-b.a)
Base. *(a::Residue{T,M}, b::Residue{T,M}) where {T<:Int64, M} = Z{T,M}(a.a*b.a)
Base. -(a::Residue{T,M}) where {T<:Int64, M} = Z{T,M}(-a.a)
Base. display(a::Residue{T,M}) where{T<:Int64,M} = println(a.a)
