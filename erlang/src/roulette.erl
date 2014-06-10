
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
		{monitor, Process} -> link(Process),print("Monitoring process"),monitor();
		{'EXIT', From, Reason} -> print("process died with reason"), print(Reason), print(From)
	end.

% returns id of Gun process
run() ->
	Gun = spawn(fun loop/0),
	Coroner = spawn(fun monitor/0),
	Coroner ! {monitor, Gun},
	Gun.