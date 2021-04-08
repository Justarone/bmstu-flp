domains
  name = string
  phone = integer
  surname = string
  
predicates
  entry(phone, name, surname)

clauses
  entry(666, "Dima", "Yacubovich").
  entry(777, "Lexa", "Romanovich").
  entry(888, "Lexa", "Petrovich").
  entry(1, "Mixail", "Nintendovich").
  entry(800, "Sergey", "Kononenkovich").
  
goal
  entry(Phone, "Lexa", Surname).