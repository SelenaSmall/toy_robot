require 'rspec'
require 'spec_helper'
require './lib/handle_input'

describe HandleInput do
  describe '#initialize' do
    it 'should have a robot attribute which is nil' do
      instance = HandleInput.new(@robot, @table)

      expect(instance.robot).to be_nil
    end

    it 'should have a table attribute which is nil' do
      instance = HandleInput.new(@robot, @table)

      expect(instance.table).to be_nil
    end
  end

  describe '#interpret' do
    it 'should return a string if command matches place pattern' do
      instance = HandleInput.new(Robot.new, Table.new)
      command = 'PLACE 1,2,NORTH'      

      expect(instance.interpret(command)).to be_a String
      expect(instance.interpret(command)).to match(/^PLACE\s+\d+\s*,\s*\d+\s*,\s*(WEST||NORTH||EAST||SOUTH)$/)      
    end

    it 'should return nil if command does not match a valid pattern' do
      instance = HandleInput.new(Robot.new, Table.new)
      command = 'hello'

      expect(instance.interpret(command)).to be_nil
    end
  end
end
