# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180102051731) do

  create_table "artists", force: :cascade do |t|
    t.string  "name"
    t.integer "discogs_id"
  end

  create_table "artists_releases", id: false, force: :cascade do |t|
    t.integer "artist_id"
    t.integer "release_id"
    t.index ["artist_id"], name: "index_artists_releases_on_artist_id"
    t.index ["release_id"], name: "index_artists_releases_on_release_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string  "name"
    t.integer "discogs_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlists_tracks", id: false, force: :cascade do |t|
    t.integer "playlist_id"
    t.integer "track_id"
    t.index ["playlist_id"], name: "index_playlists_tracks_on_playlist_id"
    t.index ["track_id"], name: "index_playlists_tracks_on_track_id"
  end

  create_table "release_videos", force: :cascade do |t|
    t.integer "release_id"
    t.integer "video_id"
    t.index ["release_id"], name: "index_release_videos_on_release_id"
    t.index ["video_id"], name: "index_release_videos_on_video_id"
  end

  create_table "releases", force: :cascade do |t|
    t.string  "title"
    t.integer "label_id"
    t.string  "catno"
    t.integer "discogs_id"
    t.integer "year"
    t.index ["label_id"], name: "index_releases_on_label_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string  "title"
    t.integer "release_id"
    t.string  "position"
    t.integer "video_id"
    t.index ["release_id"], name: "index_tracks_on_release_id"
    t.index ["video_id"], name: "index_tracks_on_video_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "duration"
    t.string "video_id"
  end

end
