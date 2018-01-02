class AddWebsiteToTrains < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :website, :string
  end
end
