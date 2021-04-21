domains
  num = integer

predicates
  max2(num, num, num)
  max3(num, num, num, num)
  max2short(num, num, num)
  max3short(num, num, num, num)
  
clauses
  max2(N1, N2, N1) :- N1 >= N2.
  max2(N1, N2, N2) :- N2 >= N1.

  max2short(N1, N2, N1) :- N1 >= N2, !.
  max2short(_, N2, N2).

  max3(N1, N2, N3, N1) :- N1 >= N2, N1 >= N3.
  max3(N1, N2, N3, N2) :- N2 >= N1, N2 >= N3.
  max3(N1, N2, N3, N3) :- N3 >= N1, N3 >= N2.

  max3short(N1, N2, N3, N1) :- N1 >= N2, N1 >= N3, !.
  max3short(_, N2, N3, N2) :- N2 >= N3, !.
  max3short(_, _, N3, N3).

goal
  max2(1, 2, Max).
  %max2short(2, 1, Max).
  %max3(4, 2, 3, Max).
  %max3short(4, 2, 3, Max).
