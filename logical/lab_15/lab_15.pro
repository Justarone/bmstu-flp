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
  name = string
  ind_property = building(name, price);
    region(name, price);
    water_transport(mark, color, price);
    car(mark, color, price).
  
predicates
  phone(surname, phone, address)
  bank_depositor(surname, bank, id, amount)
  owner(surname, ind_property)

  all_objects(surname, name)
  all_objects_with_price(surname, name, price)
  
clauses
  phone("Perestoronin", "+79999999999", addr("Moscow", "Lesnaya", 12, 2)).
  phone("Romanov", "+71111111111", addr("Moscow", "Lesnaya", 13, 87)).
  phone("Nitenko", "+73333333333", addr("Ekaterinburg", "Kamennaya", 13, 87)).
  phone("Yacuba", "+66666666666", addr("Moscow", "Wall-street", 123, 87)).

  owner("Nitenko", car("bmw", "green", 1000)).
  owner("Nitenko", region("empty field", 1000)).
  owner("Nitenko", building("Moscow center", 1000)).
  owner("Romanov", car("bmw", "green", 1000)).
  owner("Romanov", region("rublevka", 10000)).
  owner("Romanov", building("mini-village", 20000)).
  owner("Romanov", water_transport("bmw", "red", 10000)).
  owner("Yacuba", car("golfR", "black", 20000)).
  owner("Yacuba", building("tiktok", 200000)).
  owner("Perestoronin", car("mercedes", "yellow", 30000)).
  owner("Perestoronin", building("tent", 10)).

  bank_depositor("Nitenko", "Sber", 22, 1000).
  bank_depositor("Yacuba", "Sber", 33, 10000).
  bank_depositor("Yacuba", "Alfa", 44, 20000).
  bank_depositor("Romanov", "Sper", 238, 10).
  bank_depositor("Perestoronin", "Maze", 1, 10000).

  all_objects(Surname, Name) :- owner(Surname, car(Name, _, _)).
  all_objects(Surname, Name) :- owner(Surname, building(Name, _)).
  all_objects(Surname, Name) :- owner(Surname, region(Name, _)).
  all_objects(Surname, Name) :- owner(Surname, water_transport(Name, _, _)).

  all_objects_with_price(Surname, Name, Price) :- owner(Surname, car(Name, _, Price)).
  all_objects_with_price(Surname, Name, Price) :- owner(Surname, building(Name, Price)).
  all_objects_with_price(Surname, Name, Price) :- owner(Surname, region(Name, Price)).
  all_objects_with_price(Surname, Name, Price) :- owner(Surname, water_transport(Name, _, Price)).
goal
  %all_objects("Romanov", Name).
  %all_objects_with_price("Perestoronin", Name, Price).
