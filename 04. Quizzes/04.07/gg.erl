-module(gg).
-compile(export_all).

start() ->
    Server = spawn(fun server/0),
    [spawn(?MODULE, client, [Server]) || _N <- lists:seq(1,1)].

clientHelper(Servlet) ->
    io:format("ClientHelper ~p is created ~n", [self()]),
    Guess = rand:uniform(10),
    Ref = make_ref(),
    Servlet!{self(), Ref, Guess},
    receive
        {Servlet, Ref, tryAgain} ->
            clientHelper(Servlet);
        {Servlet, Ref, gotIt} ->
            done
    end.

client(Server) ->
    io:format("Client ~p is created ~n", [self()]),
    Ref = make_ref(),
    io:format("Client ~p sent ~p, start to server ~n", [self(), Ref]),
    Server!{self(), Ref, start},
    receive
        {Server, Ref, Servlet} ->
            clientHelper(Servlet)
    end.

server() ->
    receive
        {From, Ref, start} ->
            Servlet = spawn(?MODULE, servlet, [From,rand:uniform(10)]),
            From!({self(), Ref, Servlet})
    end.

servlet(Client,Answer) ->
    receive
        {Client, Ref, Answer} ->
            Client!({self(), Ref, gotIt}),
            io:format("Success~n", []);
        {Client, Ref, _} ->
            Client!({self(), Ref, tryAgain}),
            servlet(Client,Answer)
    end.
