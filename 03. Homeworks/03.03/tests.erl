-module(tests).
-export([start/0]).
% -include("interp.erl").
% -include("lexer.erl").


start() ->
    lists:map(fun interp:runStr/1,examples()).

examples() ->
    [ex1(), ex2(), ex3(), ex4(), ex5(), ex6(), ex7(), ex8(), ex9()].

ex1() ->
    "let x=1 in let x=3 in +(x,7)".
    % {num, 10}

ex2() ->
    "+(2,3)".
    % {num, 5}

ex3() ->
    "proc (x) +(x,3)".
    % {proc,x,
    % { plusExp,{idExp,{id,1,x}},{numExp,{num,1,3}}},
    % {dict,0,16,16,8,80,48,
    % {[],[],[],[],[],[],[],[],[],[],[],[],[],[],...},
    % {{[],[],[],[],[],[],[],[],[],[],[],[],...}}}},    

ex4() ->
    "let y=3 in proc (x) +(x,y)".
    % {proc,x,
    % { plusExp,{idExp,{id,1,x}},{idExp,{id,1,y}}},
    % {dict,1,16,16,8,80,48,
    % {[],[],[],[],[],[],[],[],[],[],[],[],[],...},
    % {{[],[],[],[],[],[],[],[],[],[[...]],[],...}}}},

ex5() ->
    "let y=3 in +(2,y)".
    % {num, 5}

ex6() ->
    "let y=proc(x) +(x,1) in y(5)".
    % {num, 6}

ex7() ->
    "let x=1 in let y=proc(z) +(z,x) in y(6)".
    % {num, 7}

ex8() ->
    "zero?(7)".
    % {bool, false}

ex9() ->
    "let x=1 in let f=proc (y) +(y,x) in let x=2 in f(3) ".
    % {num, 4}