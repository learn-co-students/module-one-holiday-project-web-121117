require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'


# to Disable Rails SQL logging in console
old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

# to Enable Rails SQL logging in console
# ActiveRecord::Base.logger = old_logger
