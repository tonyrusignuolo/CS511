-module(sensor).
-author("Elliot Wasem").
-export([sensor/2]).
% randomly reports measurements in the range 1-10 to the  watcher
% this measurement will be a random number in the range 1-11
% on generating an 11, it will crash (HOW?)
% will report measurements at random intervals in range of milliseconds 1-10,000

% each sensor has an integer ID: 0,1,2,etc
% measurement is a tuple of {ID, Measurement}
% generate random Measurement = rand:uniform(11)
% if Measurement is in range 1-10, report to watcher process
% if Measurement is 11, crash w/ report "anomalous reading"

sensor(WPID, SensorID) ->
    Sleep_time = rand:uniform(10000),
    timer:sleep(Sleep_time),
    Measurement = rand:uniform(11),
    case Measurement of
	11 ->
	    exit({SensorID, anomalous_reading});
	_ ->
	    WPID!{SensorID, Measurement},
	    sensor(WPID, SensorID)
    end.
