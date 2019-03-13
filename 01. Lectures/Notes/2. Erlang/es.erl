-module(es).
-compile(export_all).



echo() ->
    receive
	{From,Msg} ->
	    From!{self(),Msg},
	    echo();
	stop ->
	    stop
end.


client(S,M) ->
    S!{self(),M},
    io:format("Client ~w sent message ~w ~n",[self(),M]),
    receive
	{S,M} ->
	    io:format("Client ~w got message ~w ~n",[self(),M])
    end.

start() ->
    S = spawn(?MODULE,echo,[]),
    spawn(?MODULE,client,[S,1]),
    spawn(?MODULE,client,[S,2]).
	    
