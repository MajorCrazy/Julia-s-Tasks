"function st(a, n) #Возведение в степень
  if n == 0
    return 1
  end
  return a*st(a, n-1)
end"

"function fib(n) #Число Фибоначчи
  if n in (1, 2)
    return 1
  end
  return fib(n-1) + fib(n+2)
end"
  
