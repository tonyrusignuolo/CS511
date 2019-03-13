-module(interp).
-export([scanAndParse/1,runFile/1,runStr/1]).
-include("types.hrl").

loop(InFile,Acc) ->
    case io:request(InFile,{get_until,prompt,lexer,token,[1]}) of
        {ok,Token,_EndLine} ->
            loop(InFile,Acc ++ [Token]);
        {error,token} ->
            exit(scanning_error);
        {eof,_} ->
            Acc
    end.

scanAndParse(FileName) ->
    {ok, InFile} = file:open(FileName, [read]),
    Acc = loop(InFile,[]),
    file:close(InFile),
    {Result, AST} = parser:parse(Acc),
    case Result of
	ok -> AST;
	_ -> io:format("Parse error~n")
    end.


-spec runFile(string()) -> valType().
runFile(FileName) ->
    valueOf(scanAndParse(FileName),env:new()).

scanAndParseString(String) ->
    {_ResultL, TKs, _L} = lexer:string(String),
    parser:parse(TKs).

-spec runStr(string()) -> valType().
runStr(String) ->
    % io:format("1~n"),
    {Result, AST} = scanAndParseString(String),
    % io:write(AST),
    io:format("~n"),
    case Result  of
    	ok -> valueOf(AST,env:new());
    	_ -> io:format("Parse error~n")
    end.

-spec numVal2Num(numValType()) -> integer().
numVal2Num({num, N}) ->
    N.

% -spec boolVal2Bool(boolValType()) -> boolean().
% boolVal2Bool({bool, B}) ->
%     B.

-spec valueOf(expType(),envType()) -> valType().
valueOf({letExp, Var, Val, Exp}, Env) ->
    valueOf(Exp, env:add(Env, Var, valueOf(Val, Env)));
valueOf({numExp, N}, _) ->
    case N of
        {num, _, Val} -> {num, Val};
        _ -> error
        %maybe print an error? io:format("ERROR!~n"), io:write(N);
    end;
valueOf({plusExp, Val1, Val2}, Env) ->
    % io:format("~n"),
    % io:write(Val1),
    % io:format("~n"),
    % io:write(Val2),
    % io:format("~n"),
    % io:write(Env),
    % io:format("~n"),
    {num, numVal2Num(valueOf(Val1, Env)) + numVal2Num(valueOf(Val2, Env))};
valueOf({idExp, Var}, Env) ->
    env:lookup(Env, Var);
valueOf({procExp, {_, _, Var}, Exp}, Env) ->
    {proc, Var, Exp, Env};
valueOf({appExp, ID, Val}, Env) ->
    {proc, Var, Exp, PEnv} = valueOf(ID, Env),
    valueOf({letExp, {id, 1, Var}, Val, Exp}, PEnv);
valueOf({isZeroExp, Val}, _) ->
    {bool, Val =:= 0}.