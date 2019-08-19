class PizzaIngredient < ActiveRecord::Base
  belongs_to :pizza
  belongs_to :ingredient
end
