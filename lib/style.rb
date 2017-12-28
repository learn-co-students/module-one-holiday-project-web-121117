class Style < ActiveRecord::Base
  has_many :restaurant_styles
  has_many :restaurants, through: :restaurant_styles


  def self.type_of_food(style)
    Restaurant.where(:style == style)
  end

end
