unless := method(
    (call sender doMessage(call message argAt(0))) ifFalse(
    call sender doMessage(call message argAt(1))) ifTrue(
    call sender doMessage(call message argAt(2)))
)

a := 1 println
b := 2 println


unless(a != b, write("the numbers are the same\n"), write("the numbers are different\n"))
unless(a == b, write("the numbers are different\n"), write("the numbers are the same\n"))