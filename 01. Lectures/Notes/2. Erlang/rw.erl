-module(rw).
-compile(export_all).

start(R, W) ->
    RW = spawn(?MODULE, loop, [0, 0]),
    register(rw, RW),
    [spawn(?MODULE, reader, []) || _ <- lists:seq(1, R)],
    [spawn(?MODULE, writer, []) || _ <- lists:seq(1, W)].

reader() ->
    Ref = make_ref(),
    RW = whereis(rw),
    RW!{self(), Ref, start_read},
    receive{RW, Ref, ok_to_read} ->
        read
    end.

writer() ->
        Ref = make_ref(),
        RW = whereis(rw),
        RW!{self(), Ref, start_read},
        receive{RW, Ref, ok_to_read} ->
            read
        end.
        
loop(R, W) ->
    receive
        {From, Ref, start_read} when W == 0 ->
            From!{self(), Ref, ok_to_read},
            loop(R + 1, W);
        {From, Ref, end_read} ->
            loop(R-1, W);
        {From, Ref, start_write} when W == 0, R == 0  ->
            From!{self(), Ref, ok_to_write},
            loop(R, W + 1);
        {From, Ref, end_write} ->
            loop(R, W -1)
    end.

% further consideration: as soon as a witer comes along no more readers should be accepted to be fair to writers. Solution in slides.