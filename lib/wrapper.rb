# WRAPPER = Discogs::Wrapper.new("Test OAuth", user_token: "my_user_token")
# WRAPPER.get_request_token(KEYS["DISCOGS_API_KEY"], KEYS["DISCOGS_API_SECRET"], "127.0.0.1:3000")
class Wrapper

  attr_accessor :discogs, :response, :request, :routes, :session

  @@discogs = Discogs::Wrapper.new("Discogs Player")

end
