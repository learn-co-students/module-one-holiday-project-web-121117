class Restaurant < ActiveRecord::Base
  has_many :restaurant_styles
  has_many :styles, through: :restaurant_styles

  def self.find_closest(x=5)
    self.order(:distance).reverse.first(x)
  end

  def self.highest_rated(x=5)
    self.order(:rating).first(x)
  end

  def self.cheapest(x=5)
    self.order(:price).reverse.first(x)
  end

end
