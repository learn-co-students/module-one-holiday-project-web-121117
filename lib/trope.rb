class Trope < ActiveRecord::Base
  has_many :artistic_work_tropes
  has_many :artistic_works, through: :artistic_work_tropes
end
