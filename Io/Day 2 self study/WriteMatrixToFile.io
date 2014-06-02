m := Matrix clone dim(3,4)
m set(1,4, "foo")
m set(3,4, "bar")

m  println

new_m := m transpose

new_m println

new_m save("new_matrix.txt")

loaded := Matrix loadFromFile("new_matrix.txt")

loaded print
loaded get(4,1) println
loaded get(4,3) println