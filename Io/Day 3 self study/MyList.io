curlyBrackets := method(
    list := List clone
    call message arguments foreach(arg,
           list push(call sender doMessage(arg))
    )
    list
)

n := 5

{"four", n + 4, 6} println