-module(eb81).
-compile(export_all).

% 1.

% start() ->


% couter() ->


% turnstyle(N) ->
%     receive
%         {from, write} ->
%             turnstyle(N+1);
%         {from, read} ->
%             From!{ok, N},
%             turnstyle(N)
%     end.


% 2.

% server() ->
%     receive
%         {Client, start} ->
%             io:fwrite("start\n"),
%             server(Client, "")
%     end.
% server(Client, String) ->
%     receive
%         {Client, add, S} ->
%             Str = String++S,
%             io:fwrite("~w\n",[Str]),
%             server(Client, Str);
%         {Client, done} ->
%             io:fwrite("Done!"),
%             Client!{String},
%             server()
%     end.

% start2() ->
%     S = spawn(?MODULE, server, []).


% 3.

% server() ->
%     receive
%         {continue} ->

%         {counter} ->

% 4.

% timer(Time, PIDs) ->
%     timer:sleep(Time),
%     [PID!{tick} || PID <- PIDs],
%     timer(Time, PIDs).

% client(N) ->
%     receive
%         {tick} ->
%             io:format("Client ~w got a tick\n", [N])
%     end,
%     client(N).

% start4(Time, Clients) ->
%     PIDs = [spawn(?MODULE, client, [N]) || N <- lists:seq(1, Clients)],
%     spawn(?MODULE, timer, [Time, PIDs]).

% 5.

% timer(Time, PIDs) ->
%     timer:sleep(Time),
%     receive
%         {From, reg} ->
%             PIDs1 = lists:append(PIDs, From)
%     end,
%     [PID!{tick} || PID <- PIDs1],
%     timer(Time, PIDs1).

% client(N) ->
%     receive
%         {tick} ->
%             io:format("Client ~w got a tick\n", [N])
%     end,
%     client(N).
% client(Timer, N) ->
%     Timer!{self(), reg},
%     client(N).

% start5(Time, Clients) ->
%         Timer = spawn(?MODULE, timer, [Time, []]),
%         PIDs = [spawn(?MODULE, client, [Timer, N]) || N <- lists:seq(1, Clients)].


% 7.1, 7.2

% start71(M, W, Time) ->
%     S = spawn(?MODULE, server, [0, false]),
%     [spawn(?MODULE, man, [S]) || _ <- lists:seq(1, M)],
%     [spawn(?MODULE, woman, [S]) || _ <- lists:seq(1, W)],
%     spawn(?MODULE, itGotLate, [Time, S]).

% itGotLate(Time, S) ->
%     timer:sleep(Time),
%     R = make_ref(),
%     S!{self(), R, itGotLate},
%     receive
%         {S, R, ok} ->
%             done
%     end.

% woman(S) ->
%     S!{self(), woman}.

% man(S) ->
%     Ref = make_ref(),
%     S!{self(), Ref, man},
%     receive{S, Ref, ok} ->
%         ok
%     end.

% server(Women, false) ->
%     receive
%         {From, R, itGotLate} ->
%             From!{self(), R, ok},
%             server(0, true);
%         {_From, woman} ->
%             io:fwrite("Woman entered\n"),
%             server(Women+1, false);
%         {From, Ref, man} when Women > 1 ->
%             From!{self(), Ref, ok},
%             io:fwrite("Man entered\n"),
%             server(0, false)
%     end;
% server(_Women, true) ->
%     receive
%         {_From, woman} ->
%             io:fwrite("Woman entered\n"),
%             server(0, true);
%         {From, Ref, man} ->
%             From!{self(), Ref, ok},
%             io:fwrite("Man entered\n"),
%             server(0, true)
%     end.

% 8

start8() ->
    spawn(?MODULE, server, []).

server() ->
    receive
        {From, Ref, start} ->
            Servlet = spawn(?MODULE, servlet, [From, Ref, rand:uniform(10)]),
            From!{self(), Ref, Servlet},
            server();
        stop ->
            stop
    end.

servlet(From, Ref, Answer) ->
    receive
        {From, Ref, Guess} when Guess =:= Answer ->
            From!{self(), Ref, gotIt};
        {From, Ref, _} ->
            From!{self(), Ref, tryAgain},
            servlet(From, Ref, Answer)
    end.

client(S) ->
    Ref = make_ref(),
    S!{self(), Ref, start},
    receive
        {S, Ref, Servlet} ->
            clientHelper(Servlet, Ref)
    end.

clientHelper(Servlet, Ref) ->
    Guess = rand:uniform(10),
    Servlet!{self(), Ref, Guess},
    io:fwrite("Client guessed ~w", [Guess]),
    receive
        {Servlet, Ref, tryAgain} ->
            io:fwrite(" incorrectly :(\n"),
            clientHelper(Servlet, Ref);
        {Servlet, Ref, gotIt} ->
            io:fwrite(" correctly :)\n"),
            ggm8
    end.

newClient(S) ->
    spawn(?MODULE, client, [S]).