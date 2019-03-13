-module(env).
-compile(export_all).
-include("types.hrl").


-spec new()-> envType().
new() ->
    % complete
    dict:new().

-spec add(envType(),atom(),valType())-> envType().
add(Env,Key,Value) ->
    % complete
    dict:store(Key, Value, Env).

-spec lookup(envType(),atom())-> valType().
lookup(Env,Key) ->
    % complete
    % io:format("~n"),
    % io:write(Key),
    % io:format("~n"),
    % io:write(Env),
    case dict:is_key(Key, Env) of
       true -> dict:fetch(Key, Env);
       false -> hello
    end.
    % {_, A} = dict:find(Key, Env),
    % A.

%case dict:is_key(Key, Env) of
  %true -> dict:fetch(Key, Env);
  %false -> {id, Key}
% end.
