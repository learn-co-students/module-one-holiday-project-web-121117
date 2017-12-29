class CreateCharacterActors < ActiveRecord::Migration[5.0]
  def change
    create_table :character_actors do |t|
      t.integer :character_id
      t.integer :actor_id
    end
  end
end
