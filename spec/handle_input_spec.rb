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
    it 'should return an instance of Position command matches PLACE pattern' do
      instance = HandleInput.new(Robot.new, Table.new)
      command = 'PLACE 1,2,NORTH'

      expect(instance.interpret(command)).to be_a Position
    end

    it 'should return nil if robot is not in place' do
      instance = HandleInput.new(Robot.new, Table.new)
      command = ''

      expect(instance.interpret(command)).to be_nil
    end

    it 'should return an instance of Position if command matches MOVE pattern' do
      instance = HandleInput.new(Robot.new, Table.new)
      command1 = 'PLACE 1,2,NORTH'
      command2 = 'MOVE'

      instance.interpret(command1)

      expect(instance.interpret(command2)).to be_a Position
    end

    it 'should return an instance of Position if command matches LEFT pattern' do
      instance = HandleInput.new(Robot.new, Table.new)
      command1 = 'PLACE 1,2,NORTH'
      command2 = 'LEFT'

      instance.interpret(command1)

      expect(instance.interpret(command2)).to be_a Position
    end

    it 'should return an instance of Position if command matches RIGHT pattern' do
      instance = HandleInput.new(Robot.new, Table.new)
      command1 = 'PLACE 1,2,NORTH'
      command2 = 'RIGHT'

      instance.interpret(command1)

      expect(instance.interpret(command2)).to be_a Position
    end

    it 'should return nil if command matches REPORT pattern' do
      instance = HandleInput.new(Robot.new, Table.new)
      command1 = 'PLACE 1,2,NORTH'
      command2 = 'REPORT'

      instance.interpret(command1)

      expect(instance.interpret(command2)).to be_nil
    end
  end

  describe '#exec' do
    it 'should return an instance of Position if position is a valid table position' do
      instance = HandleInput.new(Robot.new, Table.new)
      position = Position.new(0, 0, 'NORTH')

      expect(instance.exec(position)).to be_a Position
    end

    it 'should return nil if position is not a valid table position' do
      instance = HandleInput.new(Robot.new, Table.new)
      position = Position.new(0, 6, 'NORTH')

      expect(instance.exec(position)).to be_nil
    end
  end
end
