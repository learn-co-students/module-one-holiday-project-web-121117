class CreatePizzas < ActiveRecord::Migration[4.2]
  def change
    create_table :pizzas do |t|
      t.string :name
    end
  end
end
