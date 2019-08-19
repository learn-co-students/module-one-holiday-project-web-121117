meat = Pizza.create(name: "Meat Lovers")
veggie = Pizza.create(name: "Veggie Lovers")
hawaiian = Pizza.create(name: "Hawaiian")
supreme =  Pizza.create(name: "Supreme")
buffalo = Pizza.create(name: "Buffalo Chicken")
spinach_alfredo = Pizza.create(name: "Spinach Alfredo")
cheese = Pizza.create(name: "Cheese")

pepperoni = Ingredient.create(name: "Pepperoni")
iSausage = Ingredient.create(name: "Italian Sausage")
ham = Ingredient.create(name: "Ham")
bacon = Ingredient.create(name: "Bacon")
cBacon = Ingredient.create(name: "Canadian Bacon")
chicken = Ingredient.create(name: "Chicken")

mushrooms = Ingredient.create(name: "Mushrooms")
rOnions = Ingredient.create(name: "Red Onions")
gPeppers = Ingredient.create(name: "Green Bell Peppers")
bOlives = Ingredient.create(name: "Black Olives")
spinach = Ingredient.create(name: "Spinach")
pineapple = Ingredient.create(name: "Pineapple")
bPeppers = Ingredient.create(name: "Banana Peppers")

tomato = Ingredient.create(name: "Tomato Sauce")
bSauce = Ingredient.create(name: "Buffalo Sauce")
alfredo = Ingredient.create(name: "Alfredo Sauce")

c_topping = Ingredient.create(name: "Cheese")



meat.ingredients << pepperoni
meat.ingredients << iSausage
meat.ingredients << ham
meat.ingredients << bacon
meat.ingredients << cBacon
meat.ingredients << tomato
meat.ingredients << c_topping

veggie.ingredients << mushrooms
veggie.ingredients << rOnions
veggie.ingredients << gPeppers
veggie.ingredients << bOlives
veggie.ingredients << spinach
veggie.ingredients << tomato
veggie.ingredients << c_topping

hawaiian.ingredients << pineapple
hawaiian.ingredients << ham
hawaiian.ingredients << tomato
hawaiian.ingredients << c_topping
hawaiian.ingredients << gPeppers

supreme.ingredients << pepperoni
supreme.ingredients << iSausage
supreme.ingredients << mushrooms
supreme.ingredients << gPeppers
supreme.ingredients << rOnions
supreme.ingredients << tomato
supreme.ingredients << c_topping

buffalo.ingredients << chicken
buffalo.ingredients << bSauce
buffalo.ingredients << bPeppers
buffalo.ingredients << rOnions
buffalo.ingredients << c_topping

spinach_alfredo.ingredients << alfredo
spinach_alfredo.ingredients << spinach
spinach_alfredo.ingredients << c_topping

cheese.ingredients << tomato
cheese.ingredients << c_topping
