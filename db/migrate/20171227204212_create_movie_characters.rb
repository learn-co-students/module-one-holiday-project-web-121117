class CreateMovieCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_characters do |t|
      t.integer :movie_id
      t.integer :character_id
    end
  end
end
