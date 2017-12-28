require "json"
require "http"
require "optparse"
require 'yaml'
require_relative '../config/environment'

Restaurant.destroy_all
Style.destroy_all
RestaurantStyle.destroy_all
###################################7000 total results - make pull from multiple pages#####################
#####ADAPTED FROM YELP API's GITHUB
keys = YAML.load_file('keys.yml')
API_KEY = keys['API_KEY']

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path

def search
  url = "#{API_HOST}#{SEARCH_PATH}"
  params = {term: "restaurant", location: "11 Broadway, New York, NY 10004", limit: 50}
  response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
  response.parse
end
#####
lunch_options = search.map {|k,v| v}

#SORTING INTO DATABASE
  #create Restaurant Instances
lunch_options[0].each do |restaurant_hash|
  name = restaurant_hash["name"]
  # price = restaurant_hash["price"].length #n
  address = restaurant_hash["location"]["display_address"][0]
  rating = restaurant_hash["rating"]
  restaurant_hash["transactions"].include?("delivery") ? delivery = true : delivery = false
  phone_number = restaurant_hash["display_phone"]
  distance = (restaurant_hash["distance"] * 0.00062137).round(2)

  Restaurant.create(name: name, address: address, rating: rating, delivery?: delivery, phone_number: phone_number, distance: distance) #price: price, -> get this working?
end

#create Style Instances
categories_from_yelp = []
lunch_options[0].each do |restaurant_hash|
  restaurant_hash["categories"].each do |hash_arr|
    hash_arr.each do |k,v|
      if k == "title"
        categories_from_yelp << v
      end
    end
  end
end
categories_from_yelp.uniq.each do |category_name|
  new_category = Style.find_or_create_by(name: category_name)
end

#create RestaurantStyle Instances
lunch_options[0].each do |restaurant_hash|
  relevant_restaurant = Restaurant.find_by(name: restaurant_hash["name"])
  relevant_styles = []
  restaurant_hash["categories"].each do |hash_arr|
    hash_arr.each do |k,v|
      if k == "title"
        relevant_styles << Style.find_by(name: v)
      end
    end
  end
  relevant_styles.each do |style_instance|
    RestaurantStyle.create(restaurant_id: relevant_restaurant.id, style_id: style_instance.id)
  end
end
