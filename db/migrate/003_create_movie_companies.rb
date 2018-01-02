class CreateMovieCompanies < ActiveRecord::Migration
  def change
    create_table :movie_companies do |mc|
      mc.references :movie
      mc.references :company
    end
  end
end
