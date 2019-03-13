-module(gg). 
-compile(export_all).


start () ->
    spawn(fun server/0).

server() ->
    receive
	{From,Ref,start} ->
	    ServLet=spawn(?MODULE,servLet,[From,rand:uniform(10)]),
	    From!{self(),Ref,ServLet},
	    server()
    end.
	    
servLet(Client,Solution) ->
    receive
	{Client,Ref,Solution} ->
	    Client!{self(), Ref,gotIt};
	{Client,Ref,_} ->
	    Client!{self(),Ref,tryAgain},
	    servLet(Client,Solution)
    end.

client(S) ->
    Ref = make_ref(),
    S!{self(),Ref,start},
    receive
	{S,Ref,ServLet} ->
	    client_loop(ServLet,1)
    end.

client_loop(ServLet,Attempts) ->
    Ref=make_ref(),
    N = rand:uniform(10),
    ServLet!{self(),Ref,N},
    receive
	{ServLet,Ref,gotIt} ->
	    io:format("Client ~w guessed right (~w) after ~w attempts~n",[self(),N,Attempts]);
	{ServLet,Ref,tryAgain} ->
	    client_loop(ServLet,Attempts+1)
    end.
    
  
