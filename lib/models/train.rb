require 'open-uri'
class Train < ActiveRecord::Base
  has_many :lines
  has_many :stations, through: :lines

end
