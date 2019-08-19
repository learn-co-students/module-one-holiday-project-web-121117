class CreateModels < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.string :name
      t.timestamps
    end

    create_table :playlists_tracks, id: false do |t|
      t.belongs_to :playlist
      t.belongs_to :track
    end

    create_table :tracks do |t|
      t.string :title
      t.belongs_to :release
    end

    create_table :releases do |t|
      t.string :title
      t.belongs_to :label
    end

    create_table :artists_releases, id: false do |t|
      t.belongs_to :artist
      t.belongs_to :release
    end

    create_table :artists do |t|
      t.string :name
    end

    create_table :labels do |t|
      t.string :name
    end

    create_table :videos do |t|
      t.string :title
      t.string :duration
      t.string :video_id
      t.belongs_to :release
      t.belongs_to :track
    end
  end
end
