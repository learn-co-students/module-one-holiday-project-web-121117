require_relative '../config/environment'
require_relative '../lib/cli_model'

new_cli = CommandLineInterface.new
# new_cli.greet
# input = new_cli.gets_user_input

new_cli.run 

#
# greet
# gets_user_input
