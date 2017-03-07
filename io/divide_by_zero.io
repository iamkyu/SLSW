by_zero := 1/0
by_zero println

Number divide := Number getSlot("/")
Number / = method(denominator,
    if(denominator == 0,
       0,
       call target divide(denominator)
     )
)

by_zero = 1/0
by_zero println
