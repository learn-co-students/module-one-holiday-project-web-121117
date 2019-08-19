class CreateLines < ActiveRecord::Migration[4.2]

  def change
    create_table :lines do |t|
      t.string :name
      t.integer :station_line_id
      t.timestamps
    end
  end

end
