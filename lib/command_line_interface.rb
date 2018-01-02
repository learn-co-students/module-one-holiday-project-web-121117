require 'colorize'

class CommandLineInterface
  def greet
    puts "\nWelcome".colorize(:color => :blue) + " to".colorize(:color => :yellow) +
    " the".colorize(:color => :red) + " Magic".colorize(:color => :green) +
    " Pizza".colorize(:color => :blue) + " Parlor".colorize(:color => :yellow) +
    " App".colorize(:color => :red) + "!".colorize(:color => :green)
  end

  def options
    puts "\nChoose from one of the follow options to proceed:"
    puts "     List All Pizzas".colorize(:color => :blue) + " - see all of the options to fill you with happiness."
    puts "     List All Ingredients".colorize(:color => :blue) + " - see all of our wonderful ingredients."
    puts "     Pizza Ingredients".colorize(:color => :blue) + " - see which ingredients are in your magical pizza."
    puts "     Find Ingredient".colorize(:color => :blue) + " - search for pizzas including a specific ingredient."
    puts "     See Pizza".colorize(:color => :blue) + " - see what you future pizza holds for you."
    puts "     Exit".colorize(:color => :blue) + " - say goodbye until next time."
    puts "\nPlease make a selection:"
    input = gets.downcase.chomp
  end

  def gets_user_input
    puts "\nPlease put your selection here:"
    gets.chomp
  end

  def all_ingredients
    Ingredient.all.collect {|ingredient| ingredient.name}
  end

  def all_pizzas
    Pizza.all.collect {|pizza| pizza.name}
  end

  def pre_find_pizza
    puts "Which pizza would you like to check out?"
    puts all_pizzas
    puts "\nType selection here:"
  end

  def find_pizza(input)
    result = Pizza.find_by(name: input)
    if result
      result
    else
      puts "That is not a pizza we currently make. Please try another one."
      new_input = gets.chomp
      find_pizza(new_input)
    end
  end

  def find_ingredients(pizza)
    pizza.ingredients
  end

  def show_ingredients(ingredients)
    ingredients.map {|ingredient| puts ingredient.name}
  end

  def pre_search_ingredients
    puts "Which ingredient are you searching for?"
    puts all_ingredients
    puts "\nType selection here:"
  end

  def find_ingredient(input)
    result = Ingredient.find_by(name: input)
    if result
      result
    else
      puts "This is not currently an ingredient we use. Try again."
      new_input = gets.chomp
      find_ingredient(new_input)
    end
  end

  def find_pizzas(ingredient)
    ingredient.pizzas
  end

  def show_pizzas(pizzas)
    pizzas.map {|pizza| puts pizza.name}
  end


  def manager_access_prompt
    puts "\nChoose from one of the follow options to proceed:"
    puts "     List All Pizzas".colorize(:color => :red)
    puts "     List All Ingredients".colorize(:color => :red)
    puts "     Pizza Ingredients".colorize(:color => :red)
    puts "     Create New Pizza".colorize(:color => :red)
    puts "     Create New Ingredient".colorize(:color => :red)
    puts "     Add Ingredient".colorize(:color => :red)
    puts "     Remove Ingredient".colorize(:color => :red)
    puts "     Update Pizza Image URL".colorize(:color => :red)
    puts "     Delete Pizza".colorize(:color => :red)
    puts "     Delete Ingredient".colorize(:color => :red)
    puts "     Main Menu".colorize(:color => :red)
    puts "     Exit".colorize(:color => :red)
    puts "\nInput choice here:"
  end

  def run
    input = options

    if input == 'list all pizzas'
      puts all_pizzas
      puts "\n"
      run
    elsif input == 'list all ingredients'
      puts all_ingredients
      puts "\n"
      run
    elsif input == 'pizza ingredients'
      pre_find_pizza
      new_input = gets.chomp
      pizza = find_pizza(new_input)
      ingredients = find_ingredients(pizza)
      show_ingredients(ingredients)
      puts "\n"
      run
    elsif input == 'find ingredient'
      pre_search_ingredients
      new_input = gets.chomp
      ingredient = find_ingredient(new_input)
      pizzas = find_pizzas(ingredient)
      show_pizzas(pizzas)
      puts "\n"
      run
    elsif input == 'see pizza'
      pre_find_pizza
      new_input = gets.chomp
      pizza = find_pizza(new_input)
      if pizza.image == nil
        puts "\nSorry. We haven't taken a picture of that yet. Come back next time."
        run
      else
      `open #{pizza.image}`
      puts "\n"
      run
    end
    elsif input == 'manager access'
      manager_access
    elsif input == 'exit'
      puts "\n"
      puts "G".colorize(:color => :blue) + "o".colorize(:color => :green) +
      "o".colorize(:color => :red) + "d".colorize(:color => :yellow) +
      "b".colorize(:color => :blue) + "y".colorize(:color => :green) +
      "e".colorize(:color => :red) + "!".colorize(:color => :yellow)
      puts "\n"
    else
      puts "\nThat is not an option. Good try though!"
      run
    end
  end

  def manager_access
    manager_access_prompt
    input = gets.downcase.chomp
    if input == 'list all pizzas'
      puts all_pizzas
      puts "\n"
      manager_access
    elsif input == 'list all ingredients'
      puts all_ingredients
      puts "\n"
      manager_access
    elsif input == 'pizza ingredients'
      pre_find_pizza
      new_input = gets.chomp
      pizza = find_pizza(new_input)
      ingredients = find_ingredients(pizza)
      show_ingredients(ingredients)
      puts "\n"
      manager_access
    elsif input == 'create new pizza'
      puts "\nPlease input name of new pizza here:"
      name = gets.chomp
      create_new_pizza(name)
      puts all_pizzas
      puts"\n"
      manager_access
    elsif input == 'create new ingredient'
      puts "\nPlease input name of new ingredient here:"
      name = gets.chomp
      create_new_ingredient(name)
      puts all_ingredients
      puts "\n"
      manager_access
    elsif input == 'add ingredient'
      pre_add_ingredient
      pizza_input = gets.chomp
      current_pizza = find_pizza(pizza_input)
      add_ingredient(current_pizza)
    elsif input == 'remove ingredient'
      puts "\nHere are the current pizzas as Magic Pizza Parlor:"
      puts all_pizzas
      puts "\nWhich pizza would you like to remove an ingredient from:"
      pizza = gets.chomp
      current_pizza = find_pizza(pizza)
      puts "\nHere are the current ingredients in #{current_pizza.name}"
      ingredients = find_ingredients(current_pizza)
      show_ingredients(ingredients)
      puts "\nWhich ingredient would you like to remove:"
      ingredient = gets.chomp
      current_ingredient = find_ingredient(ingredient)
      remove_ingredient(current_pizza, current_ingredient)
      puts "\n#{current_ingredient.name} was successfully removed from #{current_pizza.name}:"
    elsif input == 'update pizza image url'
      puts "\nHere are the current pizzas at Magic Pizza Parlor"
      puts all_pizzas
      puts "\n\nPlease input name of pizza to add ingredient to:"
      pizza_input = gets.chomp
      current_pizza = pizza_input
      puts "\nPlease input image url:"
      url_input = gets.chomp
      update_image(current_pizza, url_input)
      puts "\nSuccessfully updated"
      puts "\n"
      manager_access
    elsif input == 'delete pizza'
      puts "\nHere are the current pizzas at Magic Pizza Parlor:"
      puts all_pizzas
      puts "\n\nPlease input name of pizza to delete from database:"
      pizza_input = gets.chomp
      delete_pizza(pizza_input)
      puts "\nSuccessfully Deleted"
      manager_access
    elsif input == 'delete ingredient'
      puts "\nHere are the current ingredients at Magic Pizza Parlor."
      puts all_ingredients
      puts "\n\nPlease input name of ingredient to delete from database:"
      ingredient_input = gets.chomp
      delete_ingredient(ingredient_input)
      puts "\nSuccessfully Deleted"
      manager_access
    elsif input == 'exit'
      puts "\n"
      puts "G".colorize(:color => :blue) + "o".colorize(:color => :green) +
      "o".colorize(:color => :red) + "d".colorize(:color => :yellow) +
      "b".colorize(:color => :blue) + "y".colorize(:color => :green) +
      "e".colorize(:color => :red) + "!".colorize(:color => :yellow)
      puts "\n"
    elsif input == 'main menu'
      run
    else
      puts "\nThat is not an option. Going Main Menu!"
      run
    end
  end

  def create_new_pizza(name)
    pizza = Pizza.create do |p|
      p.name = name
      p.image = nil
    end
  end

  def create_new_ingredient(name)
    ingredient = Ingredient.create do |i|
      i.name = name
    end
  end

  def update_image(name, url)
    pizza = Pizza.find_by(name: name)
    pizza.image = url
    pizza.save
  end

  def pre_add_ingredient
    puts "\nHere are the current pizzas at Magic Pizza Parlor:"
    puts all_pizzas
    puts "\n\nPlease input name of pizza to add ingredient to:"
  end

  def add_ingredient(current_pizza)
    puts "\nHere are the current ingredients at Magic Pizza Parlor"
    puts all_ingredients
    puts "\n\nPlease input name of ingredient to add to #{current_pizza.name}"
    ingred_input = gets.chomp
    new_ingredient = find_ingredient(ingred_input)
    current_pizza.ingredients << new_ingredient
    puts "\n#{new_ingredient.name} has been added to #{current_pizza.name}"
    puts "\nWould you like to add another ingredient. Please type Y or N."
    user_input = gets.downcase.chomp
    if user_input == 'y'
      add_ingredient(current_pizza)
    elsif user_input == 'n'
      puts "\n"
      manager_access
    else
      puts "\nNot a valid command. Goind back to Manager field."
      manager_access
    end
  end

  def remove_ingredient(current_pizza, current_ingredient)
    removed_ingredient = PizzaIngredient.find_by(pizza_id: current_pizza.id, ingredient_id: current_ingredient.id)
    removed_ingredient.destroy
  end

  def delete_pizza(name)
    pizza = Pizza.find_by(name: name)
    pizza.destroy
  end

  def delete_ingredient(name)
    ingredient = Ingredient.find_by(name: name)
    ingredient.destroy
  end
end
