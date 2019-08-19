class CreateStationEntrances < ActiveRecord::Migration[5.0]
  def change
    create_table :station_entrances do |t|
      t.string :ns_street
      t.string :ew_street
      t.integer :station_id
    end
  end
end
