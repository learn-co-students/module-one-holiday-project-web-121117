class AddPizzaImages < ActiveRecord::Migration[4.2]
  def change
    add_column :pizzas, :image, :string
  end
end
