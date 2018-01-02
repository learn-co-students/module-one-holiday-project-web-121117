class CreateStationLines < ActiveRecord::Migration[4.2]

  def change
    create_table :station_lines do |t|
      t.string :name
      t.integer :line_id
      t.integer :station_id
      t.timestamps
    end
  end

end
