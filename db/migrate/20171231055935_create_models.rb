class CreateModels < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
    end

    create_table :collections do |t|
      t.belongs_to :users
    end

    create_table :playlists do |t|
      t.belongs_to :users
      t.string :name
    end

    create_table :artists do |t|
    end

    create_table :genres do |t|
    end

    create_table :releases do |t|
    end

    create_table :songs do |t|
      t.string :title
      t.belongs_to :artists
      t.belongs_to :release
    end

    create_table :labels do |t|
    end

    create_table :videos do |t|
      t.string :title
      t.string :duration
      t.string :video_id
    end
  end
end

# Songs - (belongs to album, artist)(has many playlists, youtube id, genres through releases) (has one label, through release, has one duration, through youtube id)
# Releases - (belongs to artist, label) (has many songs, genres)
# Artists - (has many songs, releases, labels, genres through releases, playlists through songs, youtube ids through songs)
# Labels - (has many releases, has many songs through releases, has many genres through releases, has many song ids through releases through songs)
# Genres -(has many releases, labels through releases, has many songs through releases, artists through releases)
# Playlists - (has many songs, has many artists through songs, has many releases through songs, has many genres through songs through releases). Belongs to User
# Collection - (has many songs, releases, artists, labels, genres). Belongs to User.
# User - (has one collection, has many playlists, has many songs, releases, artists, labels, genres through collection and playlists. - has many playlist_songs, has_many collection_artists, etc.
# this is kind of messy, but essentially songs saved by the user shouldn’t be saved to the collection - should be saved to a local database or things get a lot messier and rely on the API more. the collection should be more of an accessible library to add to the playlist, but you can also play releases from your collection (which should be easy since you can just grab the whole url from the scraped page)
# Video  - has ID, duration, title (eventually from scraping youtube http://youtube.com/get_video_info?video_id=XXXXXXXX)
