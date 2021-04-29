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
  props = ind_property*
  
predicates
  phone(surname, phone, address)
  bank_depositor(surname, bank, id, amount)
  owner(surname, ind_property)

  get_price(ind_property, price)
  money_amount(surname, price)
  collect_properties(surname, props, props)
  collect_properties(surname, props)
  not_exist(ind_property, props)
  sum_props(props, price)
  sum_props(props, price, price)
  
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
  owner("Sukocheva", car("Mercedes", "pink", 1111)).
  owner("Sukocheva", car("BMW", "lightblue", 2222)).
  owner("Sukocheva", car("Porshe", "black", 3333)).
  owner("Sukocheva", region("rublevka", 2000)).
  owner("Sukocheva", region("dacha garden", 100)).
  owner("Sukocheva", building("university", 200000)).
  owner("Sukocheva", building("house", 110000)).
  owner("Sukocheva", building("dacha", 100000)).
  owner("Sukocheva", water_transport("Yachta", "white", 1000000)).

  bank_depositor("Nitenko", "Sber", 22, 1000).
  bank_depositor("Yacuba", "Sber", 33, 10000).
  bank_depositor("Yacuba", "Alfa", 44, 20000).
  bank_depositor("Romanov", "Sper", 238, 10).
  bank_depositor("Perestoronin", "Maze", 1, 10000).

  not_exist(H, [H | _]) :- !, fail.
  not_exist(Prop, [_ | T]) :- not_exist(Prop, T).
  not_exist(_, []).

  collect_properties(Surname, Acc, Res) :- owner(Surname, Prop), not_exist(Prop, Acc), !, collect_properties(Surname, [Prop | Acc], Res).
  collect_properties(_, Acc, Res) :- Res = Acc.
  collect_properties(Surname, Res) :- collect_properties(Surname, [], Res).
  
  get_price(building(_, Price), Price).
  get_price(region(_, Price), Price).
  get_price(water_transport(_, _, Price), Price).
  get_price(car(_, _, Price), Price).

  sum_props([Prop | T], Acc, Res) :- get_price(Prop, Price), Nacc = Acc + Price, sum_props(T, Nacc, Res).
  sum_props([], Acc, Res) :- Res = Acc.
  sum_props(Props, Res) :- sum_props(Props, 0, Res).

  money_amount(Surname, Res) :- collect_properties(Surname, [], Props), sum_props(Props, Res).
goal
  %collect_properties("Nitenko", [], Props).
  money_amount("Sukocheva", Res). %1418766
