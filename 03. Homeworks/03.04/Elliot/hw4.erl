-module(hw4).
-author("Elliot Wasem").
-export([start/0]).
-import(watcher,[w_spawn_sensors/3]).

setup_loop(N, 1, Start_ID) ->
    spawn(watcher, w_spawn_sensors, [N, Start_ID, dict:new()]);
setup_loop(N, Num_watchers, Start_ID) ->
    spawn(watcher, w_spawn_sensors, [10, Start_ID, dict:new()]),
    setup_loop(N-10, Num_watchers-1, Start_ID + 10).

start() ->
    {ok, [ N ]} = io:fread("enter number of sensors> ", "~d"),
    if N =< 1 ->
	    io:fwrite("setup: range must be at least 2~n", []);
       true ->
	    Num_watchers = 1 + (N div 10),
	    setup_loop(N, Num_watchers, 0)
    end.
