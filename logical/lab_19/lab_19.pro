domains
  elem = integer
  intlist = elem*

predicates
  rlength(integer, integer, intlist)
  length(integer, intlist)

  rsum(integer, integer, intlist)
  sum(integer, intlist)

  roddsum(integer, integer, intlist)
  oddsum(integer, intlist)

  append(intlist, intlist, intlist).

clauses
  rlength(Res, Len, [_ | T]) :- Nlen = Len + 1, !, rlength(Res, Nlen, T).
  rlength(Res, Len, []) :- Res = Len, !.
  length(Res, List) :- rlength(Res, 0, List), !.

  rsum(Res, Sum, [H | T]) :- Nsum = Sum + H, !, rsum(Res, Nsum, T).
  rsum(Res, Sum, []) :- Res = Sum, !.
  sum(Res, List) :- rsum(Res, 0, List), !.

  roddsum(Res, Sum, [_, H | T]) :- Nsum = Sum + H, !, roddsum(Res, Nsum, T).
  roddsum(Res, Sum, []) :- Res = Sum, !.
  oddsum(Res, List) :- roddsum(Res, 0, List), !.

  append([], L2, L2) :- !.
  append([H | T], L2, [H | T3]) :- append(T, L2, T3), !.

goal
  %length(Res, [1, 2, 3, 4]).
  %sum(Res, [1, 2, 3, 4]).
  %oddsum(Res, [1, 2, 3, 4]).
  append([1, 2, 3], [4, 5, 6], Res).
