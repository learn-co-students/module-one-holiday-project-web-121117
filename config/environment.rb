require 'bundler'
Bundler.require

require_relative '../lib/command_line_interface'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
