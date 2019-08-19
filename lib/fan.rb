

class Fan < ActiveRecord::Base
  has_many :relationships
  has_many :shows, through: :relationships

  def list_shows
    hold = self.shows
    result = "#{self.name}\'s favorite shows are "
    if hold.length == 0
      return "#{self.name} does not have any favorite shows."
    elsif hold.length == 1
      return "#{self.name}\'s favorite show is #{hold[0].name}."
    elsif hold.length == 2
      return "#{self.name}\'s favorite shows are #{hold[0].name} and #{hold[1].name}."
    else
      hold.each do |show_object|
        if show_object == hold[hold.length-1]
          result += "and #{show_object.name}!"
        else
          result += "#{show_object.name}, "
        end
      end
    end
    result
  end

  def self.list_fans_with_id
    hold = self.select(:name, :id)
    result = []
    hold.each do |fan_object|
      # result << fan_object.nam
      puts "#{fan_object.id} #{fan_object.name}"
    end
    result
  end


end
