class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |m|
      m.string :title
    end
  end
end
