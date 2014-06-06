-module(util).
-export([print/1]).

print(S) -> io:fwrite("~p~n",[S]).