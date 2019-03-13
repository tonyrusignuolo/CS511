emptyCheck(Q) ->
   if is_empty(Q) ->
      true
   end,
   (i, Q1) = queue:out(Q),
   if (i =:= empty) ->
      false
   end,
   emptyCheck(Q1).


isCompleteHelper(Q) ->
   (i, Q1) = queue:out(Q)
   if (i == empty) ->
      emptyCheck(Q1)
   end,
   (val, left, right) = i,
   isCompleteHelper(queue:in(right, queue:in(left, Q1))).