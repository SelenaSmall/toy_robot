#!/usr/bin/ruby

require_relative './lib/table'
require_relative './lib/robot'
require_relative './lib/handle_input'

table = Table.new
robot = Robot.new

# Keep reading user inputs while the program is running
loop do
  puts 'Select your command'
  input = gets.chomp

  unless /^EXIT$/.match?(input)
    command = HandleInput.new(robot, table)

    command.interpret(input)
    next
  end

  puts 'Goodbye!'
  break
end
