-module(day2).
-export([each/2]).
-export([map/2]).
-export([filter/2]).
-export([foldl/3]).



each(F,[H|T]) -> F(H), each(F,T);
each(F,[]) -> done.

map(F,[H|T]) -> [F(H)| map(F,T)];
map(F,[]) -> [].

filter(F, [H|T]) -> 
  case F(H) of
    true -> [H| filter(F,T)];
    false -> filter(F,T)
  end;
filter(F,[]) -> [].

foldl(F, Init, [H|T]) -> foldl(F, F(H, Init), T);
foldl(F, Init, []) -> Init.
