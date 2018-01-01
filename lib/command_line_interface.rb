require 'colorize'

class CommandLineInterface
  def greet
    puts "Welcome to the Magic Pizza Parlor App!".colorize(:color => :blue)
  end

  def options
    puts "\nChoose from one of the follow options to proceed:"
    puts "     List All Pizzas".colorize(:color => :blue) + " and see all of the options to fill you with happiness."
    puts "     List All Ingredients".colorize(:color => :blue) + " and see all of our wonderful ingredients."
    puts "     Pizza Ingredients".colorize(:color => :blue) + " and see which ingredients are in your magical pizza."
    puts "     Find Ingredient".colorize(:color => :blue) + " and search for pizzas including a specific ingredient."
    puts "     See Pizza".colorize(:color => :blue) + " and see what you future pizza holds for you."
    puts "     Exit".colorize(:color => :blue) + " and say goodbye until next time."
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
      new_input = gets.downcase.chomp
      find_ingredient(new_input)
    end
  end

  def find_pizzas(ingredient)
    ingredient.pizzas
  end

  def show_pizzas(pizzas)
    pizzas.map {|pizza| puts pizza.name}
  end

  def show_pizza_image(name)
  end

  def manager_access_prompt
    puts "\nChoose from one of the follow options to proceed:"
    puts "     Create New Pizza".colorize(:color => :red)
    puts "     Create New Ingredient".colorize(:color => :red)
    puts "     Add Ingredient".colorize(:color => :red)
    puts "     Update Pizza Image URL".colorize(:color => :red)
    puts "     Delete Pizza".colorize(:color => :red)
    puts "     Delete Ingredient".colorize(:color => :red)
    puts "     Main Menu".colorize(:color => :red)
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
      `open #{pizza.image}`
      puts "\n"
      run
    elsif input == 'manager access'
      manager_access
    elsif input == 'exit'
      puts "Goodbye!"
    else
      puts "\nThat is not an option. Good try though!"
      run
    end
  end

  def manager_access
    manager_access_prompt
    input = gets.downcase.chomp
    if input == 'create new pizza'
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
      puts "\nHere are the current pizzas at Magic Pizza Parlor:"
      puts all_pizzas
      puts "\n\nPlease input name of pizza to add ingredient to:"
      pizza_input = gets.chomp
      current_pizza = find_pizza(pizza_input)
      puts "\nHere are the current ingredients at Magic Pizza Parlor"
      puts all_ingredients
      puts "\n\nPlease input name of ingredient to add to #{current_pizza.name}"
      ingred_input = gets.chomp
      new_ingredient = find_ingredient(ingred_input)
      current_pizza.ingredients << new_ingredient
      puts "\n#{new_ingredient.name} has been added to #{current_pizza.name}"
      puts "\n"
      manager_access
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
    else input == 'main menu'
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

  def delete_pizza(name)
    pizza = Pizza.find_by(name: name)
    pizza.destroy
  end

  def delete_ingredient(name)
    ingredient = Ingredient.find_by(name: name)
    ingredient.destroy
  end
end
