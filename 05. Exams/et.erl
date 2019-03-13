-module(et).
-compile(export_all).

% 2. 

meta_search() ->
    receive
        {request, From, Ref, Query} ->
            spawn(?MODULE, meta_search_helper, [From, Ref, Query]),
            meta_search()
    end.

meta_search_helper(From, Ref, Query) ->
    whereis(google_pid)!{self(), Query},
    whereis(bing_pid)!{self(), Query},
    whereis(yahoo_pid)!{self(), Query},
    receive
        {Engine1, Result1} ->
            receive
                {Engine2, Result2} ->
                    receive
                        {Engine3, Result3} ->
                            From!{response, Ref, lists:concat(Result1, Result2, Result3)}
                    end
            end
    end.