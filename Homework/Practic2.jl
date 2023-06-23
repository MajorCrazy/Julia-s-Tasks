# prac 2 
#1
function binpow(a::Float64, n::Float64)
    if (n==0)
        return 1
    end
    if (n%2==1)
        return binpow(a,n-1)*a
    else
        b=binpow(a,n/2)
        return b*b
    end
end


function non_rec_binpow(a::Int64, n::Int64)
    res=1                                   
    while n&gt;0                               
        if n%2!=0                           
            res*=a                          
        end 
        a*=a                                
        n=div(n,2)                          
    end
    return res                  
end



println(non_rec_binpow(2,5))

#2
function non_rec_binpow(a::Float64, n::Float64)
    res=1                                   
    while n&gt;0                               
        if n%2!=0                           
            res*=a                          
        end 
        a*=a                                
        n=div(n,2)                          
    end
    return res                  
end

function fib_num(n::Float64)
    first_num=(1+sqrt(5))/2
    second_num=(1-sqrt(5))/2
    divider=sqrt(5)

    ans=(non_rec_binpow(first_num,n)-non_rec_binpow(second_num,n))/divider
    return ans
end

print(fib_num(6.0))

#3
function my_log(a, x, e)
    z=x; t=1; y=0
#ИНВАРИАНТ:  x = z^t * a^y
    while z &lt; 1/a || z &gt; a || t &gt; e 
        if z &lt; 1/a
            z *= a 
            y += t 
        elseif z &gt; a
            z /= a 
            y -= t 
        elseif t &gt; e
            t /= 2 
            z *= z 
        end
    end
    return y
end

println(my_log(7,17,0.00001))


#4
function bisection_method(f, a, b, tol)
    # f - функция, уравнение f(x) = 0 которой нужно решить
    # a, b - границы отрезка, на котором ищем решение
    # tol - точность, с которой нужно найти решение
    
    while (b-a)/2 &gt; tol
        c = (a+b)/2
        if f(c) == 0
            return c
        elseif f(a)*f(c) &lt; 0
            b = c
        else
            a = c
        end
    end
    return (a+b)/2
end

f(x) = x^2-2
a=0
b=2
tol=1e-6
x=bisection_method(f,a,b,tol)
println(x)

#5
function bisection_method(f, a, b, tol)
    # f - функция, уравнение f(x) = 0 которой нужно решить
    # a, b - границы отрезка, на котором ищем решение
    # tol - точность, с которой нужно найти решение
    
    while (b-a)/2 &gt; tol
        c = (a+b)/2
        if f(c) == 0
            return c
        elseif f(a)*f(c) &lt; 0
            b = c
        else
            a = c
        end
    end
    return (a+b)/2
end

f(x)= cos(x)-x
a=0
b=1
tol=1e-6
println(bisection_method(f,a,b,tol))

#6
function newton(r::Function, x; epsilon = 1e-8, num_max = 10)
    dx = r(x); x += dx; k=1
    while abs(dx) &gt; epsilon &amp;&amp; k &lt; num_max
        dx = r(x); x += dx; k += 1
    end
    abs(dx) &gt; epsilon &amp;&amp; @warn(&quot;accuracy did not reached&quot;)
    return x
end

f(x) = 0
root = newton(f, 1.0)
println(root)

#7
function newton(r::Function, x; epsilon = 1e-8, num_max = 10)
    dx = r(x); x += dx; k=1
    while abs(dx) &gt; epsilon &amp;&amp; k &lt; num_max
        dx = r(x); x += dx; k += 1
    end
    abs(dx) &gt; epsilon &amp;&amp; @warn(&quot;accuracy did not reached&quot;)
    return x
end

f(x) = cos(x)-x
root = newton(f, 1.0)
println(root)

#8
function newton(r::Function, x; epsilon = 1e-8, num_max = 10)
    dx = r(x); x += dx; k=1
    while abs(dx) &gt; epsilon &amp;&amp; k &lt; num_max
        dx = r(x); x += dx; k += 1
    end
    abs(dx) &gt; epsilon &amp;&amp; @warn(&quot;accuracy did not reached&quot;)
    return x
end

f(x) = x^2+5x-7
root = newton(f, 1.0)
println(root)
