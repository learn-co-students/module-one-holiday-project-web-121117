class AddBoroughToStations < ActiveRecord::Migration[5.0]
  def change
    add_column :stations, :borough, :string
  end
end
