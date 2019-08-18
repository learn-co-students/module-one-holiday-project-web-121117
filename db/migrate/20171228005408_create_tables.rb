class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      # t.decimal :price #=> Get this working?
      t.string :address
      t.decimal :rating
      t.boolean :delivery?
      t.string :phone_number
      t.decimal :distance
    end
    create_table :styles do |t|
      t.string :name
    end
    create_table :restaurant_styles do |t|
      t.integer :restaurant_id
      t.integer :style_id
    end
  end

end
