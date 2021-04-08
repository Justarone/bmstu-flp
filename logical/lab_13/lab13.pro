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
  car_by_phone(phone, surname, mark, price)
  only_mark_by_phone(phone, mark)
  data_by_surname_and_city(surname, city, street, bank, phone)
  
clauses
  phone("Perestoronin", "+79999999999", addr("Moscow", "Lesnaya", 12, 2)).
  phone("Romanov", "+71111111111", addr("Moscow", "Lesnaya", 13, 87)).
  phone("Nitenko", "+73333333333", addr("Ekaterinburg", "Kamennaya", 13, 87)).
  phone("Yacuba", "+66666666666", addr("Moscow", "Wall-street", 123, 87)).
  car("Nitenko", "bmw", "green", 1000).
  car("Yacuba", "volkswagen", "red", 10000).
  car("Yacuba", "golfR", "black", 20000).
  car("Romanov", "bike", "white", 10).
  car("Perestoronin", "mercedes", "yellow", 30000).
  bank_depositor("Nitenko", "Sber", 22, 1000).
  bank_depositor("Yacuba", "Sber", 33, 10000).
  bank_depositor("Yacuba", "Alfa", 44, 20000).
  bank_depositor("Romanov", "Sper", 238, 10).
  bank_depositor("Perestoronin", "Maze", 1, 10000).
  
  car_by_phone(Phone, Surname, Mark, Price) :- phone(Surname, Phone, _), car(Surname, Mark, _, Price).
  only_mark_by_phone(Phone, Mark) :- car_by_phone(Phone, _, Mark, _).
  data_by_surname_and_city(Surname, City, Street, Bank, Phone) :- phone(Surname, Phone, addr(City, Street, _, _)), bank_depositor(Surname, Bank, _, _).
  
goal
  %car_by_phone("+66666666666", Surname, Mark, Price).
  %only_mark_by_phone("+66666666666", Mark).
  data_by_surname_and_city("Yacuba", "Moscow", Street, Bank, Phone).
