require_relative '../config/environment'
require_relative '../lib/command_line_interface'

cli = CommandLineInterface.new
cli.greet
cli.run
