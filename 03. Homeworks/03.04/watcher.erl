-module(watcher).
-compile(export_all).
-compile(watcher).
-compile(sensor).
-export([watcher/2]).
-import(sensor, [sensor/2]).
  
watch(Sensors) ->
    io:fwrite("Watcher: ~w, Sensor List: ~w~n", [self(), Sensors]),
    receive
        {'DOWN', _Ref, _Type, PID, {ID, Reason}} ->
            io:fwrite("Watcher: ~w, Sensor: ~w, Reason: ~w~n", [self(), ID, Reason]),
            {PID1, _} = spawn_monitor(sensor, sensor, [self(), ID]),
            io:fwrite("Watcher: ~w, Sensor: ~w, Respawn~n", [self(), ID]),
            Sensors1 = lists:delete({ID, PID}, Sensors),
            watch(lists:append(Sensors1, [{ID, PID1}]));
        {ID, Measurement} ->
            io:fwrite("Watcher: ~w, Sensor: ~w, Measurement: ~w~n", [self(), ID, Measurement]),
            watch(Sensors)
    end.

watcher(Start, End) ->
        process_flag(trap_exit, true),
        Sensors1 = [{ID, spawn_monitor(sensor, sensor, [self(), ID])} || ID <- lists:seq(Start, End)],
        Sensors = [{ID, PID} || {ID, {PID, _}} <- Sensors1],
        % io:fwrite("~w~n", [Sensors1]),
        io:fwrite("~w~n", [Sensors]),
        watch(Sensors).
        