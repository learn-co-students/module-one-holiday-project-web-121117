class CreateArtisticWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :artistic_works do |t|
      t.string :name
      t.integer :release_year
    end
  end
end
