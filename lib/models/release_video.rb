class ReleaseVideo < ActiveRecord::Base
  belongs_to :video
  belongs_to :release
end
