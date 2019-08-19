

class Relationship < ActiveRecord::Base
  belongs_to :fan
  belongs_to :show
end
