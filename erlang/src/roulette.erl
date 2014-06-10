
-module(roulette).
-export([loop/0]).
-export([monitor/0]).
-export([run/0]).


% send a number, 1-6
loop() ->
	receive
		3 -> print("bang!!!"),exit({roulette,die,at,erlang:time()});
		_ -> print("click..."), loop()
	end.

print(S) -> io:fwrite("~p~n",[S]).


monitor() ->
	process_flag(trap_exit, true),
	receive 
		new -> 
			print("Creating and monitoring process"),
			register(revolver, spawn_link(fun loop/0)),
			monitor();
		{'EXIT', From, Reason} -> 
			io:format("The shooter ~p died with reason ~p", [From,Reason]), 
			print(" Restarting"), 
			self() ! new,
			monitor()
	end.

% returns id of Gun process
run() ->
	Doc = spawn(fun monitor/0),
	Doc ! new.