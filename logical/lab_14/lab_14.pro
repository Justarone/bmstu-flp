domains
  surname = string
  city, street = string
  house, flat = integer
  phone = string
  address = addr(city, street, house, flat)
  mark = string
  color = string
  price = integer
  bank = string
  id, amount = integer
  
predicates
  phone(surname, phone, address)
  car(surname, mark, color, price)
  bank_depositor(surname, bank, id, amount)
  man_by_car(mark, color, surname, city, phone, bank)
  
clauses
  phone("Perestoronin", "+79999999999", addr("Moscow", "Lesnaya", 12, 2)).
  phone("Romanov", "+71111111111", addr("Moscow", "Lesnaya", 13, 87)).
  phone("Nitenko", "+73333333333", addr("Ekaterinburg", "Kamennaya", 13, 87)).
  phone("Yacuba", "+66666666666", addr("Moscow", "Wall-street", 123, 87)).
  car("Nitenko", "bmw", "green", 1000).
  car("Romanov", "bmw", "green", 1000).
  car("Yacuba", "volkswagen", "red", 10000).
  car("Yacuba", "golfR", "black", 20000).
  car("Romanov", "bike", "white", 10).
  car("Perestoronin", "mercedes", "yellow", 30000).
  bank_depositor("Nitenko", "Sber", 22, 1000).
  bank_depositor("Yacuba", "Sber", 33, 10000).
  bank_depositor("Yacuba", "Alfa", 44, 20000).
  bank_depositor("Romanov", "Sper", 238, 10).
  bank_depositor("Perestoronin", "Maze", 1, 10000).
  
  man_by_car(Mark, Color, Surname, City, Phone, Bank) :- 
      car(Surname, Mark, Color, _),
      phone(Surname, Phone, addr(City, _, _, _)),
      bank_depositor(Surname, Bank, _, _).
  
goal
    man_by_car("bmw", "green", Surname, City, Phone, Bank).
    %man_by_car("volkswagen", "red", Surname, City, Phone, Bank).
    %man_by_car("ford", "mustang", Surname, City, Phone, Bank).
