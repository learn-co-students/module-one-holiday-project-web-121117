class Line < ActiveRecord::Base
  belongs_to :train
  belongs_to :station 
end
