-module(hw6).
-compile(export_all).
-author("Anthony Rusignuolo").

% Ring is created so that the node number increases in a clockwise order.

start(N) ->
    MyNumbers = lists:seq(1, N),
    % MyNumbers = [rand:uniform(N) || _ <- lists:seq(1, N)],    
    PIDs = [spawn(?MODULE, node, [MyNumber]) || MyNumber <- MyNumbers],
    [First | Suffix] = PIDs,
    Lefts = Suffix ++ [First],
    [lists:nth(Number, PIDs)!{start, lists:nth(Number, Lefts)} || Number <- lists:seq(1, N)].

node(MyNumber) ->
    receive
        {start, Left} ->
            io:fwrite("MyNumber: ~w, start~n", [MyNumber]),
            Left!{MyNumber, elect},
            nodeHelper(MyNumber, Left)
    end.

nodeHelper(MyNumber, Left) ->
    receive
        {Number, elect} ->
            if 
                Number > MyNumber ->
                    Left!{Number, elect};
                Number == MyNumber ->
                    Left!{MyNumber, winner};
                true ->
                    false
            end,
            nodeHelper(MyNumber, Left);
        {Number, winner} ->
            if
                Number > MyNumber ->
                    Left!{Number, winner},
                    io:fwrite("I am node ~w and I know the leader is node ~w~n", [MyNumber, Number]);
                Number == MyNumber ->
                    io:fwrite("I am node ~w and I am the leader~n", [MyNumber])
            end
    end.