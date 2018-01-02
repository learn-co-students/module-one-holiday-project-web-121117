class CreateStationLines < ActiveRecord::Migration[5.0]
  def change
    create_table :station_lines do |t|
      t.integer :line_id
      t.integer :station_id
    end
  end
end
