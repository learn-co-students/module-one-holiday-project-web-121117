class CreateRelationship < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :fan_id
      t.integer :show_id
      t.integer :rating
    end
  end
end
