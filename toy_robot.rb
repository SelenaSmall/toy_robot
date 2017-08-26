#!/usr/bin/ruby

require_relative './lib/robot'

robot = Robot.new

# Keep reading user inputs while the program is running
loop do
  puts 'Select your command'
  input = gets.chomp

  unless input == 'EXIT'
    position = robot.place(input)
    puts "Position: #{position.x},#{position.y}"

    robot.update_robot(position)

    puts 'placed' unless robot.not_in_place?
    next
  end

  puts 'Goodbye!'
  break
end
