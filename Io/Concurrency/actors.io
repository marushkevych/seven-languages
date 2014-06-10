slower := Object clone
faster := Object clone

counter := Object clone
counter count := 0
counter increment := method(
    wait(4)
    writeln("incrementing")
    count = count +1
    count
)

slower start := method(
    wait(2)
    count := counter @increment
    writeln("slowly")
    writeln(count, "- slow count")
)
faster start := method(
    wait(1)
    count := counter @increment
    writeln("quickly");
    writeln(count, "- quick count")
)


slower @@start; faster @@start; wait(12)
