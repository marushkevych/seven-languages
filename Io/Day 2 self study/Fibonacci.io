fib := method(n,
    if(n < 3, 1,    
        secondLast := 0
        last := 1
        count := 2
        while(count <= n, 
            sum := secondLast + last
            secondLast = last
            last = sum println
            count = count +1
        )
        sum
    )
)

fibRec := method(n,
    
    doRec := method(count, secondLast, last,
        last println
        if(count >= n, last,
            doRec(count + 1, last, secondLast + last)
        )
    )
    doRec(1, 0, 1)    
)


fibRec(8)