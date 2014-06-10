OperatorTable addAssignOperator(":", "atPutNumber")

Map atPutNumber := method(key, value,
    self atPut(key asMutable removePrefix("\"") removeSuffix("\""), value)
)

curlyBrackets := method(arg,
    r := Map clone
    call message arguments foreach(arg,
           r doMessage(arg)
    )
    r
)

 
s := File with("phonebook.txt") openForReading contents
s println
map := doString(s)

map keys println
map values println
map at("Bob Smith") println
map at("Mary") println
