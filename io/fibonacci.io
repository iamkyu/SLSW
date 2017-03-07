fib := method(n,
    fib_sum := 0
    next := 1
    for(i, 1, n,
        tmp := fib_sum
        fib_sum = fib_sum  +  next
        next = tmp
    )
    return fib_sum
)

fib_r := method(n,
    if(n<2, n, fib_r(n-1) + fib_r(n-2))
)


"Fibonicci with loop" println
for(i, 1, 9, fib(i) println)

"Fibonicci with recursive" println
for(i, 1, 9, fib_r(i) println)
