-module(watcher).
-export([w_spawn_sensors/3]).
-import(sensor, [sensor/2]).

% watches sensors (theorhetically infinite number)
% link the watcher and sensor, so that when the sensor crashes, the watcher can catch the crash and start a replacement sensor process
% > process_flag(trap_exit, true),
% > spawn_link(?MODULE, sensor:sensor, [self()])
watch(Sensors) ->
    receive
	{'DOWN', _Ref, _Type, _Pid, {SensorID, Reason}} ->
	    io:fwrite("Watcher ~w's Sensor ~w died with message ~w~n",[self(), SensorID, Reason]),
	    {S, _} = spawn_monitor(sensor, sensor, [self(), SensorID]),
	    io:fwrite("Watcher ~w respawning Sensor with SensorID ~w to replace previous sensor which died~n", [self(), SensorID]),
	    UpdatedSensors = dict:store(SensorID, S, Sensors),
	    io:fwrite("Watcher: ~w - Sensor List: ~w~n", [self(), dict:to_list(UpdatedSensors)]),
	    watch(UpdatedSensors);
	{From, Reading} ->
	    io:fwrite("Watcher: ~w - Sensor: ~w - Reading: ~w~n", [self(), From, Reading]),
	    watch(Sensors)
    end.
w_spawn_sensors(0, _Start_ID, Sensors) ->
    io:fwrite("Watcher ~w started. Watching sensors: ~w~n", [self(), dict:to_list(Sensors)]),
    watch(Sensors);
w_spawn_sensors(N, Start_ID, Sensors) ->
    process_flag(trap_exit, true),
    {S, _} = spawn_monitor(sensor, sensor, [self(), Start_ID]),
    w_spawn_sensors(N-1, Start_ID+1, dict:store(Start_ID, S, Sensors)).
