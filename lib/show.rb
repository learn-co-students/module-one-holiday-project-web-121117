

class Show < ActiveRecord::Base
    has_many :relationships
    has_many :fans, through: :relationships

    def self.list_shows_with_id
      hold = self.select(:name, :id)
      result = []
      hold.each do |show_object|
        puts "#{show_object.id} #{show_object.name}"
      end
      result
    end

    def self.list_shows_with_rating
      hold = []
      result = Hash.new(0)
      last = ""
      self.all.each do |show_object|
        hold << show_object.name
        h = show_object.relationships.average(:rating).to_int
        result[show_object.name] += h
      end
      hold = hold.sort_by { |element| result[element] }
      hold.reverse.each do |show_name|
        last += "#{show_name} Rating: #{result[show_name]}\n"
      end
      puts last
    end

end
