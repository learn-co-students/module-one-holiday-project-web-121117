module Wrapper
  TOKEN = Psych.load_file("lib/application.yml")["USER_TOKEN"]
  WRAPPER = Discogs::Wrapper.new("Record Player for Discogs", user_token: TOKEN)
  USER = WRAPPER.get_identity.username

  def import_collection(username=USER)
    i = 1
    while i <= WRAPPER.get_user_collection(username, per_page: 100).pagination.pages
      collection_page = WRAPPER.get_user_collection(username, page: i, per_page: 100).releases
      collection_page.each do |release|
        info = release.basic_information
        new_release = Release.find_or_create_by(title: info.title, catno: info.labels.first.catno, discogs_id: info.id, year: info.year)
        info.artists.each do |artist|
          new_release.artists << Artist.find_or_create_by(name: artist.name, discogs_id: artist.id)
        end
        release_label = Label.find_or_create_by(name: info.labels.first.name, discogs_id: info.labels.first.id)
        release_label.releases << new_release
      end
      i += 1
    end
  end

  def import_tracks(release_id)
    WRAPPER.get_release(release_id).tracklist.each do |track|
      new_release.tracks << Track.find_or_create_by(position: track.position, title: track.title, release: new_release)
    end
  end
end
