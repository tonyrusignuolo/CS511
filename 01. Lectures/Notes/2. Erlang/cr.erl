-module(cr).
-compile(export_all).

start() ->
    spawn(?MODULE, restarter, []).

restarter() ->
    process_flag(trap_exit, true),
    Pid = spawn_link(?MODULE, critic, []),
    register(critic, Pid),
    receive
        {"EXIT", Pid, normal} ->
            ok;
        {"EXIT", Pid, shutdown} ->
            ok;
        {"EXIT", Pid, _} ->
            restarter()
    end.

judge(Pid, Band, Album) ->
    Pid = whereis(critic),
    Ref = make_ref(),
    Pid!{self(), Ref, {Band, Album}},
    receive
        {Ref, Criticism} ->
            Criticism
    end.

critic() ->
    receive
        {From, Ref, {"B1", "A1"}} ->
            From!{Ref, r1};
        {From, Ref, {"B2", "A2"}} ->
            From!{Ref, r2};
        {From, Ref, {"B3", "A3"}} ->
            From!{Ref, r3};
        {From, Ref, {"B4", "A4"}} ->
            From!{Ref, r4};
        _ ->
            From!{Ref, r5}
    end.