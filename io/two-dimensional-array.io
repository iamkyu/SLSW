Matrix := List clone

Matrix dim := method(x, y,
    m := Matrix setSize(y)
    m mapInPlace(v, list() setSize(x))
)

Matrix set := method(x, y, value,
    self at(y) atPut(x, value)
)

Matrix get := method(x, y,
    self at(y) at(x)
)


matrix := Matrix dim(2,2)
"dim(2,2): #{matrix}" interpolate println

matrix set(0,0,1)
matrix set(1,0,2)
matrix set(0,1,3)
matrix set(1,1,4)
"set(): #{matrix}" interpolate println

"get(0,0): #{matrix get(0,0)}" interpolate println
"get(0,1): #{matrix get(0,1)}" interpolate println
