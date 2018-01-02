require_relative 'config/environment'
require 'sinatra/activerecord/rake'



desc 'starts a console'
task :console do
  Pry.start
end


desc "adds 50 fans"
task :fans do
  50.times do
    Fan.create(name: Faker::Name.name,age: rand(16..75),state: Faker::Address.state,occupation: Faker::Job.field,marrital_status: Faker::Demographic.marital_status,sex: Faker::Demographic.sex,education_level: Faker::Job.education_level)
  end
end

desc "adds 50 shows"
task :shows do
  array_of_shows = ["Game of Thrones","House of Cards","American Horror Story","Vikings","Lost","Dexter","American Gods","The Blacklist","The Walking Dead","The Twilight Zone","Sherlock","Dr Who","Breaking Bad","Rick and Morty","Archer","Veep","Sillicon Valley","Unbreakable Kimmy Schmidt","The Handmaid's Tale","Fargo","Better Call Saul","Orange is the New Black","Westworld","Outlander","The Americans"]

  array_of_shows.each do |show|
    Show.create(name: show)
  end
end

desc "adds 50 connections"
task :relationship do
  50.times do
    h = Relationship.new(fan_id: rand(1..Fan.all.length),show_id: rand(1..Show.all.length), rating: rand(1..10))
    if !Fan.find(h.fan_id).shows.include?(Show.find(h.show_id))
      h.save
    end
  end
end
