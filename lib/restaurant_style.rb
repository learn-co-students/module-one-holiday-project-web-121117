class RestaurantStyle < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :style
end
