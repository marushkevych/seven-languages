List myAverage := method(
    if(self size == 0, 0,
        self sum / self size
    )
)

List myAverage2 := method(
    if(self size == 0, 0,
        summ := self reduce(acc, n,
            if(n type == "Number", acc + n,
               Exception raise(n .. " is not Number")
            ),
        0)
        sum / self size
    )
)

list( "a", 1) myAverage2 println