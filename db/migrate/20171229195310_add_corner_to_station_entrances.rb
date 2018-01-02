class AddCornerToStationEntrances < ActiveRecord::Migration[5.0]
  def change
    add_column :station_entrances, :corner, :string
  end
end
