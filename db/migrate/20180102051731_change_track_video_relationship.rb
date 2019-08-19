class ChangeTrackVideoRelationship < ActiveRecord::Migration[5.0]
  def change
    change_table :videos do |t|
      t.remove_belongs_to :track
      t.remove_belongs_to :release
    end
    change_table :tracks do |t|
      t.belongs_to :video
    end
    create_table :release_videos do |t|
      t.belongs_to :release
      t.belongs_to :video
    end
  end
end
