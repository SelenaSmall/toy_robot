#!/usr/bin/ruby

require_relative './lib/table'
require_relative './lib/robot'

table = Table.new
robot = Robot.new

# Keep reading user inputs while the program is running
loop do
  puts 'Select your command'
  input = gets.chomp

  unless input == 'EXIT'
    position = robot.place(input)
    # Only update robot if the position is valid on the table
    robot.update_robot(position) if table.valid_position?(position.x, position.y)

    puts "Position: #{position.x},#{position.y}"

    puts 'placed' unless robot.not_in_place?
    next
  end

  puts 'Goodbye!'
  break
end
