Socket

futureResult := URL with("http://google.com/") @fetch

writeln("Do something immediately while fetch goes on in background...")

writeln("This will block until the result is available.")
writeln("fetched ", futureResult size, " bytes")
