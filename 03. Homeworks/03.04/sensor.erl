-module(sensor).
% -compile(export_all).
-export([sensor/2]).

sensor(W, ID) ->
    Sleep_time = rand:uniform(10000),
    timer:sleep(Sleep_time),
    Measurement = rand:uniform(11),
    case Measurement of
        11 ->
            exit({ID, anomolous_reading});
        _ ->
            W!{ID, Measurement},
            sensor(W, ID)
    end.

% erl III 36
