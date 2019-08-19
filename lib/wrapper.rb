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

  def import_tracks_from_collection
    requests = 0
    Release.all.each do |release|
      if requests >= 55
        requests = 0
        sleep(60)
      end
      release_info = WRAPPER.get_release(release.discogs_id)
      release_info.tracklist.each do |track|
        new_track = Track.find_or_create_by(position: track.position, title: track.title, release: release)
        release.tracks << new_track
        if release_info.videos
          all_video_matches = release_info.videos.select do |video|
            video.title.match(/\B#{track.title}|#{track.title}/i)
          end
          matched_video = all_video_matches.last
          if matched_video
            matched_video_id = matched_video.uri.split("watch?v=").last
            new_video = Video.find_or_create_by(title: matched_video.title, duration: "#{matched_video.duration/60}:#{matched_video.duration%60}")
            new_video.tracks << new_track
            new_track.video.video_id = matched_video.uri.split("watch?v=").last
            release.videos << new_video
          end
        end
      end
      requests += 1
    end
  end

  def play(tracks=Track.all.take(50))
    url = "https://www.youtube.com/watch_videos?video_ids="
    tracks.each do |track|
      if track.video != nil
        url << track.video.video_id + ","
      end
    end
    `open #{url}`
  end
end
