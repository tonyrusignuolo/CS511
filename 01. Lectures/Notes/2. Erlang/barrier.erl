-module(barrier).
-compile(export_all).

% startc(N) ->
%     C = spawn(?MODULE, coordinator, [N, N, []]),
%     register(coordinator, C).

% start() ->
%     startc(3),
%     spawn(?MODULE, client, ["a~n", "b~n"]),
%     spawn(?MODULE, client, ["c~n", "d~n"]),
%     spawn(?MODULE, client, ["e~n", "f~n"]).

% coordinator(0, N, L) ->
%     [Client!{self(), Ref, ok} || {Client, Ref} <- L],
%     coordinator(N, N, []);
% coordinator(M, N, L) when M > 0 ->
%     receive
%         {From, Ref, arrived} ->
%             coordinator(M-1, N, [{From, Ref} | L])
%     end.

% client(Str1, Str2) ->
%     io:format(Str1),
%     Ref = make_ref(),
%     C = whereis(coordinator),
%     coordinator!{self(), Ref, arrived},
%     receive
%         {C, Ref, ok} ->
%             io:format(Str2)
%     end.


barrier(M, N, L) when M > 0 ->
    receive
        {From, Ref, arrived} ->
            coordinator(M-1, N, [{From, Ref} | L])
    end.
barrier(0, N, L) ->
    [Client!{self(), Ref, ok} ||  {Client, Ref} <- L],
    coordinator(N, N, L);

Client(Str1, Str2) ->
    io:format(Str1),
    Ref = make_ref(),
    C = whereis(coordinator),
    C!{self(), Ref, arrived}