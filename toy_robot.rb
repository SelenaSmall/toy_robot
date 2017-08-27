#!/usr/bin/ruby

require_relative './lib/table'
require_relative './lib/robot'
require_relative './lib/handle_input'

command = HandleInput.new(Robot.new, Table.new)

# Keep reading user inputs while the program is running
loop do
  puts 'Select your command'
  input = gets.chomp

  unless /^EXIT$/.match?(input)
    command.interpret(input)
    next
  end

  $stdout.print "Goodbye! \n"
  break
end
