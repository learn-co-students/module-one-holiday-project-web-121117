class CreateTropes < ActiveRecord::Migration[5.1]
  def change
    create_table :tropes do |t|
      t.string :name
    end
  end
end
