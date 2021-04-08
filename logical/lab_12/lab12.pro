domains
  name, surname, university = string
 
predicates
  student(name, surname, university)
  
clauses
  student("Alexey", "Romanov", "BMSTU").
  student("Alexey", "Romanov", "MSU").
  student("Mikhail", "Nitenko", "BMSTU").
  student("Sergey", "Kononenko", "BMSTU").
  student("Dmitry", "Yacuba", "MSU").
  student("Pavel", "Perestoronin", "BMSTU").
  student("Anton", "Olenev", University) :- student("Alexey", "Romanov", University), student("Mikhail", "Nitenko", University).
  
goal
  student(Name, Surname, "BMSTU").