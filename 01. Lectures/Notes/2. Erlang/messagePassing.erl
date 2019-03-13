-module(messagePassing).
-compile(export_all).

dolphin1() -> 
    receive
        {From, m1} ->
            From ! r1;
        {From, m2} ->
            From ! r2;
        _ ->
            io:format("R3~n")
    end.

dolphin2() ->
    receive
        {From, Message} -> 
            case Message of
                m1 -> From ! r1;
                m2 -> From ! r2
            end.
