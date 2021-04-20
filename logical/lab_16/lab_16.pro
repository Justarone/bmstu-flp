domains
  sex, name = string
  man = man(sex, name)
  
predicates
  parent(man, man)
  granny(name, name)
  grand_dad(name, name)
  grands(name, name)
  grands_mom(name, name)
  grands_all(name, name)
  
clauses
  % Переделать, в качестве аргумента передавать "F" и прочее
  granny(GName, Name) :- parent(man("F", GName), TMan),
                         parent(TMan, man(_, Name)).
  grand_dad(GName, Name) :- parent(man("M", GName), TMan),
                            parent(TMan, man(_, Name)).
  grands(Gname, Name) :- parent(man(_, Gname), Tman),
                         parent(TMan, man(_, Name)).
  grands_mom(Gname, Name) :- parent(man("F", Gname), man("F", Momsname)),
                             parent(man("F", Momsname), man(_, Name)).
  grands_all(Gname, Name) :- parent(man(_, Gname), man("F", Momsname)),
                             parent(man("F", Momsname), man(_, Name)).

  parent(man("M", "Gena"), man("M", "Pasha")).
  parent(man("F", "Lena"), man("M", "Pasha")).
  parent(man("M", "Vitaly"), man("M", "Gena")).
  parent(man("F", "Natalia"), man("M", "Gena")).
  parent(man("M", "Anatoly"), man("F", "Lena")).
  parent(man("F", "Lyalya"), man("F", "Lena")).

goal
  granny(GrannyName, "Pasha").
  %grand_dad(GrandDadName, "Pasha").
  %grands(Gname, "Pasha").
  %grands_mom(Gname, "Pasha").
  %grands_all(Gname, "Pasha").
