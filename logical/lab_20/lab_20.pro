domains
  elem = integer
  intlist = elem*

predicates
  only_odd(intlist, intlist)
  only_more(intlist, integer, intlist)
  delete_all(intlist, integer, intlist)
  delete_one(intlist, integer, intlist)
  to_set(intlist, intlist).

clauses
  only_odd([_, H | T], [H | Res]) :- !, only_odd(T, Res).
  only_odd([], []) :- !.

  only_more([H | T], Num, [H | Res]) :- H > Num, !, only_more(T, Num, Res).
  only_more([_ | T], Num, Res) :- only_more(T, Num, Res), !.
  only_more([], _, []) :- !.

  delete_all([H | T], Num, [H | Res]) :- H <> Num, !, delete_all(T, Num, Res).
  delete_all([_ | T], Num, Res) :- delete_all(T, Num, Res), !.
  delete_all([], _, []) :- !.

  delete_one([H | T], Num, T) :- H = Num, !.
  delete_one([H | T], Num, [H | Res]) :- delete_one(T, Num, Res), !.
  delete_one([], _, []) :- !.

  to_set([H | T], [H | Res]) :- delete_all(T, H, Nt), !, to_set(Nt, Res).
  to_set([], []) :- !.

goal
  %only_more([1, 2, 3, 4, 5, 6], 3, Result).
  %only_odd([1, 2, 3, 4, 5, 6], Result).
  %delete_all([1, 2, 3, 1, 2, 3, 1, 2, 3], 1, Result).
  %delete_one([1, 2, 3, 1, 2, 3, 1, 2, 3], 1, Result).
  to_set([1, 2, 3, 1, 2, 3, 1, 2, 3], Result).
