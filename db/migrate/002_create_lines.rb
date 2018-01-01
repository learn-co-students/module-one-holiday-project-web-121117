class CreateLines < ActiveRecord::Migration[4.2]
  def change
    create_table :lines do |t|
      t.string :name
    end 
  end
end
