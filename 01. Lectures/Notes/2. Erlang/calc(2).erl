-module(calc).
-export([initEnv/0,eval/2,anExpr/0]).
-author("E.B.").


-type expr() :: {const,number()}
	      | {var,string()}
	      | {add,expr(),expr()}
	      | {sub,expr(),expr()}
	      | {mul,expr(),expr()}
	      | {divi,expr(),expr()}.

-type result() :: {const,number()}.

-spec anExpr() -> expr().

anExpr() ->
    {add,
       {sub,{const,3},{const,2}},
       {var,"x"}}.


-spec initEnv() -> dict:dict(string(),result()).

initEnv() ->
    dict:append("x",{const,2},dict:append("y",{const,7},dict:new())).

-spec eval(dict:dict(string(),result()),expr()) -> string().

eval(_Env,{const,N}) ->
    {const,N};
eval(Env,{var,Id}) ->
    hd(dict:fetch(Id,Env));
eval(Env,{add,E1,E2}) ->
    {const,V1} = eval(Env,E1),
    {const,V2} = eval(Env,E2),
    {const,V1 + V2};
eval(Env,{sub,E1,E2}) ->
    {const,V1} = eval(Env,E1),
    {const,V2} = eval(Env,E2),
    {const,V1 - V2};
eval(Env,{mul,E1,E2}) ->
    {const,V1} = eval(Env,E1),
    {const,V2} = eval(Env,E2),
    {const,V1 * V2};
eval(Env,{divi,E1,E2}) ->
    {const,V1} = eval(Env,E1),
    {const,V2} = eval(Env,E2),
    {const,V1 div V2}.