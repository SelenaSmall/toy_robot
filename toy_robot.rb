#!/usr/bin/ruby

require_relative './lib/table'

# Initialize Table objects
@table = Table.new

# Is this a valid position on the table
puts @table.valid_position?(1, 0)
