function fibonacci(n)
    if n == 0
        return 1, 0
    else
        current, prev = fibonacci(n-1)
        return current, prev + current
    end
end