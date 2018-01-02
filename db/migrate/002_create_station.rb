class CreateStation < ActiveRecord::Migration[4.2]

  def change
    create_table :stations do |t|
      t.string :name
      t.integer :station_line_id
      t.timestamps
    end
  end

end
