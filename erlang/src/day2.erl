-module(day2).
-export([get/2]).
-export([getWinner/1]).


get(Map, Key) -> 
	case [V || {K, V} <- Map, K == Key] of
		[] -> none;
		[H|_] -> H
	end.

	
	
%% possible values of the board: x, o or e (empty)
getWinner(Board) ->
	case Board of
		%% rows
		[P,P,P|_] when (P =/= e) -> P;
		[_,_,_,P,P,P|_] when (P =/= e) -> P;
		[_,_,_,_,_,_,P,P,P] when (P =/= e) -> P;
		
		%% colums
		[P,_,_,P,_,_,P,_,_] when (P =/= e) -> P;
		[_,P,_,_,P,_,_,P,_] when (P =/= e) -> P;
		[_,_,P,_,_,P,_,_,P] when (P =/= e) -> P;
		
		%% diagonals
		[P,_,_,_,P,_,_,_,P] when (P =/= e) -> P;
		[P,_,_,_,P,_,_,_,P] when (P =/= e) -> P;

		_ -> no_winner
	end.

