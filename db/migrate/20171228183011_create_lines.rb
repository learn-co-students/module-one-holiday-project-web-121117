class CreateLines < ActiveRecord::Migration[5.0]
  def change
    create_table :lines do |t|
      t.string :name
      t.integer :station_id
      t.integer :train_id
      t.timestamps
    end
  end
end
