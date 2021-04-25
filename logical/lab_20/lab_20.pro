domains
  elem = integer
  intlist = elem*

predicates
  only_more(intlist, integer, intlist)
  only_odd(intlist, intlist)
  delete_all(intlist, integer, intlist)
  delete_one(intlist, integer, intlist)
  to_set(intlist, intlist).

clauses
  only_more([H | T], Num, [H | Res]) :- H > Num, only_more(T, Num, Res), !.
  only_more([_ | T], Num, Res) :- only_more(T, Num, Res), !.
  only_more([], _, []), !.

  only_odd([_, H | T], [H | Res]) :- only_odd(T, Res), !.
  only_odd([], []), !.

  delete_all([H | T], Num, [H | Res]) :- H <> Num, delete_all(T, Num, Res), !.
  delete_all([_ | T], Num, Res) :- delete_all(T, Num, Res), !.
  delete_all([], _, []), !.

  delete_one([H | T], Num, T) :- H = Num, !.
  delete_one([H | T], Num, [H | Res]) :- delete_one(T, Num, Res), !.
  delete_one([], _, []), !.

  to_set([H | T], [H | Res]) :- delete_all(T, H, Nt), to_set(Nt, Res), !.
  to_set([], []), !.

goal
  %only_more([1, 2, 3, 4, 5, 6], 3, Res).
  %only_odd([1, 2, 3, 4, 5, 6], Res).
  %delete_all([1, 2, 3, 1, 2, 3, 1, 2, 3], 1, Res).
  %delete_one([1, 2, 3, 1, 2, 3, 1, 2, 3], 1, Res).
  to_set([1, 2, 3, 1, 2, 3, 1, 2, 3], Res).
