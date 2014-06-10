// Two dimentional array
Matrix := Object clone

//Matrix data := list()

Matrix dim := method(x, y,
    self data := list()
    for(i, 0, y-1,
        data push(list() setSize(x))
    )
    self
)


Matrix print := method(
    if(self getSlot("data"), self asString print, "empty matrix" print)
)

Matrix set := method(x, y, value,
    data at(y-1) atPut(x-1, value)
    self 
)

Matrix get := method(x, y,
    data at(y-1) at(x-1)    
)

Matrix transpose := method(
    new_matrix := Matrix clone dim(data size, data at(0) size)
    for(y, 0, data size -1,
        data at(y) foreach(x, value, new_matrix set(y+1, x+1, value))
    )
    
    new_matrix
)

Matrix asString := method(
    s := Sequence clone
    data foreach(row,
        s appendSeq(row join(" "), "\n")
    )
    s
)

Matrix save := method(file,
    f := File with(file)
    f openForUpdating
    f write(self asString)
    f close
)

Matrix loadFromFile := method(file,
    m := self clone
    m data := list()
    f := File with(file)
    f openForReading
    f readLines foreach(line, m data push(line split))
    f close
    
    m
)




