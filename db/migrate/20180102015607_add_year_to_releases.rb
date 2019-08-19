class AddYearToReleases < ActiveRecord::Migration[5.0]
  def change
    add_column :releases, :year, :integer
  end
end
