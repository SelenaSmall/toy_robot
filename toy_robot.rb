#!/usr/bin/ruby

require_relative './lib/table'
require_relative './lib/robot'

# Initialize Table objects
table = Table.new
robot = Robot.new


# Is this a valid position on the table
puts table.valid_position?(1, 0)

# Ensure the robot's position is nil
puts 'Robot position is nil' if robot.position.nil?

# Keep reading user inputs while the program is running
loop do
  puts 'Select your command'
  input = gets.chomp

  unless input == 'EXIT'
    puts 'Robot has been placed' if input == 'PLACE'
    next
  end

  puts 'Goodbye!'
  break
end
