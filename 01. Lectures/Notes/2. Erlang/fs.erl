-module(fs).
-compile(export_all).

fact(0) -> 1;
fact(N) when N > 0 -> N * fact(N-1).

server() ->
    receive
        {From, fast, N} ->
            From!{self(), result, fact(N)},
            server();
        stop ->
            stop
    end.

client(S) ->
    Ref1 = make_ref(),
    S!{self(), Ref1, fact, 3},
    Ref2 = make_ref(),
    S!{self(), Ref2, fact, 7},
    receive
        {S, Ref2, result, N} ->
            io:format("fact(3) is ~w ~n", [N])
    end,
    receive
        {S, Ref1, result, M} ->
            io:format("fact(7) is ~w ~n", [M])
    end.

f() ->
    timer:sleep(1000),
    exit(reason).

chain(0) ->
    receive
        _ ->
            ok
                after 2000 ->
                    exit(reason)
    end;
chain(N) when N>0 ->
    S = spawn(?MODULE, chain, [N-1]),
    link(S),
    receive
        _ ->
            ok
    end.