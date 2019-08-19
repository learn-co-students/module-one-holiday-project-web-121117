require_relative '../config/environment'
require 'artii'

new_cli = CommandLineInterface.new

arter = Artii::Base.new

puts arter.asciify("New York Subway MTA")

# new_cli.run
new_cli.greet
