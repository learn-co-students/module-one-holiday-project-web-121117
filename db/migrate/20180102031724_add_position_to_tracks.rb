class AddPositionToTracks < ActiveRecord::Migration[5.0]
  def change
    add_column :tracks, :position, :string
  end
end
