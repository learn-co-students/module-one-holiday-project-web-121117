class Station < ActiveRecord::Base
  has_many :lines
  has_many :trains, through: :lines
end
