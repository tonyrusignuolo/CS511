-module(eb8).
-compile(export_all).

% 5.
% start(W, M, Time) ->
%    S = spawn(?MODULE, server, [0, 0, false]),
%    spawn(?MODULE, itGotLate, [Time, S]),
%    [spawn(?MODULE, man, [S]) || _ <- lists:seq(1, M)],
%    [spawn(?MODULE, woman, [S]) || _ <- lists:seq(1, W)].
%
% itGotLate(Time, S) ->
%  timer:sleep(Time),
%  R=make_ref(),
%  S!{self(), R, itGotLate},
%  receive
%    {S,R,ok} ->
%      done
%  end.
%
% woman(S) ->
%  S!{self(), woman},
%  receive
%    {_, entered} ->
%      io:format(" *    Woman ~w has entered the bar~n", [self()])
%    end.
%
% man(S) ->
%  S!{self(), man},
%  receive
%    {_, entered} ->
%      io:format("    * Man ~w has entered the bar~n", [self()])
%  end.
%
% server(Women, Men, false) ->
%  case (math:floor(Women / 2) >= 1) of
%    true ->
%      receive
%        {From, Ref, itGotLate} ->
%          From!{self(), Ref, ok},
%          server(Women, Men, true);
%        {From, man} ->
%          From!{self(), entered},
%          server(Women - 2, Men + 1, false);
%        {From, woman} ->
%          From!{self(), entered},
%          server(Women + 1, Men, false)
%        end;
%      _ ->
%        receive
%          {From, Ref, itGotLate} ->
%            From!{self(), Ref, ok},
%            server(Women, Men, true);
%          {From, woman} ->
%            From!{self(), entered},
%            server(Women + 1, Men, false)
%          end
%        end;
%
% server(Women, Men, true) ->
%  receive
%    {From, woman} ->
%      From!{self(), entered},
%      server(Women + 1, Men, true);
%    {From, man} ->
%      From!{self(), entered},
%      server(Women, Men + 1, true)
%    end.


% 5
% woman(S) ->
%   % random timer
%   S!{self(), woman}.

% man(S) ->
%   % random timer
%   Ref = make_ref(),
%   S!{self(), Ref, man},
%   receive
%     {S, Ref, ok} ->
%       ok
%   end.

% itGotLate(Time, S) ->
%   timer:sleep(Time),
%   Ref = make_ref(),
%   S!{self(), Ref, itGotLate},
%   receive
%     {S, Ref, ok} ->
%       done
%   end.

% server(Women, false) ->
%   receive
%     {_From, woman} ->
%       server(Women + 1, false);
%     {From, Ref, man} when Women > 1 ->
%       From!{self(), Ref, ok},
%       server(Women-2, false);
%     {From, Ref, itGotLate} ->
%       From!{self(), Ref, ok},
%       server(Women, true)
%   end;
% server(Women, true) ->
%   receive
%     {_From, woman} ->
%       server(Women, true);
%     {From, Ref, man} when Women > 1 ->
%       From!{self(), Ref, ok},
%       server(Women, true)
%   end.

% 6 and 7.
% servlet(Answer) ->
%     receive
% 	{From, Ref, Number} when Number =:= Answer->
% 	    io:format("client: ~w - servlet: ~w - Answer: ~w - Guess: ~w~n", [From, self(), Answer, Number]),
% 	    From!{self(), Ref, gotIt};
% 	{From, Ref, Number} ->
% 	    io:format("client: ~w - servlet: ~w - Answer: ~w - Guess: ~w~n", [From, self(), Answer, Number]),
% 	    From!{self(), Ref, tryAgain},
% 	    servlet(Answer)
%     end.
%
% play_game(Slet, Ref) ->
%     Slet!{self(), Ref, rand:uniform(10)},
%     receive
% 	{_, Ref, tryAgain} ->
% 	    play_game(Slet, Ref);
% 	{_, Ref, gotIt} ->
% 	    goodgame
%     end.
%
% client(S) ->
%     Ref = make_ref(),
%     S!{self(), Ref},
%     receive
% 	{S, Ref, Slet} ->
% 	    play_game(Slet, Ref)
%     end.
%
% new_client(S) ->
%     spawn(?MODULE, client, [S]).
%
% server() ->
%     receive
% 	{From, Ref} ->
% 	    S = spawn(?MODULE,servlet,[rand:uniform(10)]),
% 	    From!{self(), Ref, S},
% 	    io:format("Spawning servet ~w for client ~w~n", [S, From]),
% 	    server();
% 	stop -> stop
%     end.
%
% start() ->
%     spawn(?MODULE, server,[]).


% 8.
% create_client(S) ->
%   C = spawn(?MODULE,client_listener,[]),
%   S!{C, register}.

% client_listener() ->
%   receive
%     {shutdown} ->
%       shutdown;
%     {Message} ->
%       io:format("client ~w received '~w'~n",[self(), Message]),
%       client_listener()
%     end.

% start(Time) ->
%   S = spawn(?MODULE,server,[Time, []]),
%   T = spawn(?MODULE,timer,[Time, S]),
%   {T, S}.

% server(Time, PIDs) ->
%   io:format("PIDs: ~w~n", [PIDs]),
%   receive
%     {its_time} ->
%       broadcast(tick, PIDs),
%       server(Time, PIDs);
%     {From, register} ->
%       server(Time, lists:append(PIDs, [From]));
%     {shutdown} ->
%       broadcast(shutdown, PIDs)
%     end.

% timer(Time, S) ->
%   timer:sleep(Time),
%   S!{its_time},
%   timer(Time, S).

% broadcast(_, []) ->
%  done;
% broadcast(Message, [H|T]) ->
%   H!{Message},
%   broadcast(Message, T).


% not sure what number this is
% start(InitialState, F) ->
%   spawn(?MODULE, server_loop, [InitialState, F]).

% server_loop(State, F) ->
%   receive
%     {request, From, Ref, N} ->
%       case catch(F(State,N)) of
%         {'EXIT', Reason} ->
%           From!{self(), Ref, Reason, error},
%           server_loop(State, F);
%         {NewState, Result} ->
%           From!{self(), Ref, Result},
%           server_loop(NewState, F)
%       end;
%     {update, From, Ref, G} ->
%       From!{self(), Ref, State},
%       server_loop(State, G);
%     {inspect, From, Ref} ->
%       From!{self(), Ref, State},
%       server_loop(State, F);
%     stop ->
%       stop
%   end.


% 8 again
start() ->
  L = [spawn(?MODULE, client,[]) || _ <- lists:seq(1, 10)],
  spawn(?MODULE, timer, [100, L]).

timer(Frequency, L) ->
  timer:sleep(Frequency),
  [Pid!{tick} || Pid <- L],
  timer(Frequency, L).

client() ->
  receive
    {tick} ->
      client()
  end.