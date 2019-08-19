class CreateArtisticWorkTropes < ActiveRecord::Migration[5.1]
  def change
    create_table :artistic_work_tropes do |t|
      t.integer :trope_id
      t.integer :artistic_work_id
    end
  end
end
