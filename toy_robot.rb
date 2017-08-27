#!/usr/bin/ruby

require_relative './lib/table'
require_relative './lib/robot'
require_relative './lib/handle_input'

robot = Robot.new
command = HandleInput.new(robot, Table.new, Action.new(robot))

$stdout.print "Options: PLACE X,Y,F; MOVE; LEFT; RIGHT; REPORT; EXIT\n"

# Reading user input
loop do
  input = gets.chomp

  unless /^EXIT$/.match?(input)
    command.interpret(input)
    next
  end

  $stdout.print "Goodbye! \n"
  break
end
