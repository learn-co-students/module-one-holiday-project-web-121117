class AddDiscogsIdToArtistsLabels < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :discogs_id, :integer
    add_column :labels, :discogs_id, :integer
  end
end
