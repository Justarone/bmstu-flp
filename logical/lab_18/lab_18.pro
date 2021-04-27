domains
  num = integer

predicates
  fact(num, num)
  rfact(num, num, num)

  fib(num, num)
  rfib(num, num, num, num)

clauses
  rfact(N, Res, Acc) :- N > 1, !, Nn = N - 1, Tacc = Acc * N, rfact(Nn, Res, Tacc).
  rfact(_, Res, Acc) :- Res = Acc, !.
  fact(N, Res) :- rfact(N, Res, 1), !.

  rfib(N, A, B, Res) :- N > 2, !, Na = B, Nb = B + A, Nn = N - 1, rfib(Nn, Na, Nb, Res).
  rfib(_, _, B, Res) :- Res = B, !.
  fib(N, Res) :- rfib(N, 1, 1, Res), !.

goal
  %fact(3, Res).
  fib(6, Res).
