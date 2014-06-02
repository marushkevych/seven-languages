

Number divide := Number getSlot("/")

Number / = method(n,
    if(n == 0, 0, self divide(n))
)


5/2 println
res := 5/2
res println
res = 5/0 
res println


