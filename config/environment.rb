require 'bundler'
Bundler.require

require 'active_record'
require 'rake'

require_relative '../lib/restaurant.rb'
require_relative '../lib/style.rb'
require_relative '../lib/restaurant_style.rb'

#turned off SQL Messages to console
ActiveRecord::Base.logger.level = 1

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
