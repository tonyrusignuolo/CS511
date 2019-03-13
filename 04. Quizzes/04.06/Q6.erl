-moodule(ic).
-compile(export_all).

-type bt() :: {node, number(), bt(), bt()}
    | {empty}.

-spce all_empty(queue:queue(bt())) -> boolean().

leaf(N) ->
    {node, N, {empty}, {empty}}.

t1() ->
    {node, 2,
        {node, 10,
            {empty},
            leaf(7)}
        leaf(12)}

all_empty(Q) ->
    case queue:is_empty(Q) of 
        true ->
            true;
        _ -> {{value, T} Q2} = queue:out(Q),
        case T of
            {empty} ->
                all_empty(Q2);
            _ -> false
end
