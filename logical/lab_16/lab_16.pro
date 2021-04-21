domains
  sex = symbol
  name = string
  man = man(sex, name)
  
predicates
  parent(man, man)
  grandparent(man, sex, name)
  
clauses
  grandparent(man(Sex, Gname), Tsex, Name) :- parent(man(Sex, Gname), man(Tsex, Tname)),
                         parent(man(Tsex, Tname), man(_, Name)).

  parent(man(f, "Lena"), man(m, "Pasha")).
  parent(man(m, "Gena"), man(m, "Pasha")).
  parent(man(m, "Vitaly"), man(m, "Gena")).
  parent(man(f, "Natalia"), man(m, "Gena")).
  parent(man(m, "Anatoly"), man(f, "Lena")).
  parent(man(f, "Lyalya"), man(f, "Lena")).

goal
  grandparent(man(f, Gname), _, "Pasha").
  %grandparent(man(m, Gname), _, "Pasha").
  %grandparent(man(_, Gname), _, "Pasha").
  %grandparent(man(f, Gname), f, "Pasha").
  %grandparent(man(_, Gname), f, "Pasha").
