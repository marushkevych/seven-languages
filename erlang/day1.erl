-module(day1).
-export([countWords/1]).
-export([countTo10/1]).
-export([log/1]).




countWords(String)-> doCountWords(0, string:tokens(String, " ")).

doCountWords(I, []) -> I;

doCountWords(I, Words)-> 
	[Head | Tail] = Words,
	doCountWords(I+1, Tail).

countTo10(10) -> 10;
countTo10(N) -> 
	if 
		N < 10 -> 
		io:fwrite("~p~n",[N]),
		countTo10(N+1);
		true -> io:fwrite("~p~n",["argument is latger than 10"])
	end.

log(success) -> io:fwrite("~p~n",["success"]);
log({error, Message}) -> io:fwrite("~p~n",[Message]).



