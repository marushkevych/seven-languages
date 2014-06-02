in := File standardInput
"hello there! Guess a number between 1 and 100" println
random := Random value(1, 100) round println
guess := in readLine asNumber
prevGuess := nil
count := 1

getHint := method(prev, curr,
                
    if(prev == nil, "try again",
        prevDiff := (prev - random) abs
        currDiff := (curr - random) abs
        if(prevDiff == currDiff, "try again",
           if(prevDiff < currDiff, "colder", "hotter")
        ) 
    )
    
)

while(guess != random,
    if(count == 10) then("sorry" println; return)
    getHint(prevGuess, guess) println
    prevGuess = guess
    guess := in readLine asNumber
    count = count +1
    
)



writeln("you got it!")
in close

