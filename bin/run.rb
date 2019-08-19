require_relative '../config/environment'

# enable/disabe SQL log
ActiveRecord::Base.logger.level = 1

new_cli = CommandLineInterface.new
new_cli.run
