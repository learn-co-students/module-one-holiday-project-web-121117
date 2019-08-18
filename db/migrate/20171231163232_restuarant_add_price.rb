class RestuarantAddPrice < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :price, :string
  end
end
