class CreatePizzaIngredients < ActiveRecord::Migration[4.2]
  def change
    create_table :pizza_ingredients do |t|
      t.integer :pizza_id
      t.integer :ingredient_id
    end
  end
end
