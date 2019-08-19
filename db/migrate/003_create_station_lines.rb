class CreateStationLines < ActiveRecord::Migration[4.2]
  def change
    create_table :station_lines do |t|
      t.integer :station_id
      t.integer :line_id
      t.string :arrival
    end
  end
end
