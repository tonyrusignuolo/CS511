-module(hw4).
-compile(export_all).
-author("Anthony Rusignuolo and Elliot Wasem").
-import(watcher, [watcher/2]).
% -include("sensor.erl").
% -include("watcher.erl").

% setupLoop(NSensors, 1, Start) ->
%     spawn(watcher, 


start(NSensors) ->
    % {ok, [NSensors]} = io:fread("Sensors? ", "~d"),
    % NWatchers = 1 + (NSensors div 10),
    % setupLoop(NSensors, NWatchers, 0)
    [spawn(watcher, watcher, [((N-1)*10), ((N*10)-1)]) || N <- lists:seq(1, round(math:floor(NSensors/10)))],
    [spawn(watcher, watcher, [((N-1)*10), ((N*10)-1)]) || N <- lists:seq((NSensors - (NSensors rem 10)), (NSensors - 1))].