-module(notes).
-compile(export_all).
-author("A.R").

hello() -> "Hello, world!".

fact(0) -> 1;
fact(N) when N > 0 -> N * fact(N-1).

arith(X,Y) ->
    io:format("Arguments: ~p ~p~n", [X, Y]),
    Sum = X + Y,
    Diff = X - Y,
    Prod = X * Y,
    Quo = X div Y,
    io:fwrite("~p ~p ~p ~p~n", [Sum, Diff, Prod, Quo]),
    {Sum, Diff, Prod, Quo}.

drivers_license(Age) when Age < 16 ->
    forbidden;  
drivers_license(Age) when Age == 16; Age == 17 ->
    'learners permit';
drivers_license(Age) when Age >= 65 ->
    'vision test recommended, but not required';
drivers_license(_) ->
    'full license'.

-spec sum(List) -> number() when
    List :: [number()].

sum(L) -> sum(L, 0).
sum([H|T], Sum) -> sum(T, Sum + H);
sum([], Sum) -> Sum.

area({square, Side}) -> Side*Side;
area({circle, Radius}) -> Radius*Radius*math:pi().

mult(A, B) -> A * B.

double(A) -> 2 * A.

distance(T1, T2) ->
    {X1, Y1} = T1,
    {X2, Y2} = T2,
    math:sqrt(math:pow((X2 - X1), 2) + math:pow((Y2 - Y1),2)).

fib(0) -> 0;
fib(1) -> 1;
fib(N) -> fib(N - 2) + fib(N - 1).

turnstile(0) ->
    receive
        {From, exit} ->
            From!({self(), exited}),
            turnstile(1);
        stop -> stop
    end;
turnstile(N) ->
    receive
        {From, enter} ->
            From!({self(), entered}),
            turnstile(N-1);
        {From, exit} ->
            From!({self(), exited}),
            turnstile(N+1);
        stop -> stop        
    end.

client(S) ->
    S!({self(), enter}),
    receive
        {S, entered} ->
            S!({self(), exit}),
            receive
                {S, exited} ->
                    done
            end
    end.

start() ->
    S=spawn(?MODULE, turnstile, [5]),
    spawn(?MODULE, client, [S]),
    spawn(?MODULE, client, [S]),
    spawn(?MODULE, client, [S]),
    spawn(?MODULE, client, [S]),
    spawn(?MODULE, client, [S]),
    spawn(?MODULE, client, [S]),
    spawn(?MODULE, client, [S]),
    spawn(?MODULE, client, [S]),
    spawn(?MODULE, client, [S]),
    spawn(?MODULE, client, [S]),
    spawn(?MODULE, client, [S]),
    spawn(?MODULE, client, [S]),
    spawn(?MODULE, client, [S]),
    spawn(?MODULE, client, [S]),
    spawn(?MODULE, client, [S]),
    S.