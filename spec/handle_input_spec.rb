require 'rspec'
require 'spec_helper'
require './lib/handle_input'

describe HandleInput do
  describe '#initialize' do
    it 'should have a table attribute which is nil' do
      instance = HandleInput.new(@robot, @table, @action)

      expect(instance.table).to be_nil
    end

    it 'should have a action attribute which is nil' do
      instance = HandleInput.new(@robot, @table, @action)

      expect(instance.action).to be_nil
    end
  end

  describe '#interpret' do
    it 'should return an instance of Position when command matches PLACE pattern' do
      instance = HandleInput.new(Robot.new, Table.new, Action.new)
      command = 'PLACE 1,2,NORTH'

      expect(instance.interpret(command)).to be_a Position
    end

    it 'should return nil when robot is not in place' do
      instance = HandleInput.new(Robot.new, Table.new, Action.new)
      command = ''

      expect(instance.interpret(command)).to be_nil
    end

    it 'should return an instance of Position when command matches MOVE pattern' do
      instance = HandleInput.new(Robot.new, Table.new, Action.new)
      command1 = 'PLACE 1,2,NORTH'
      command2 = 'MOVE'

      instance.interpret(command1)

      expect(instance.interpret(command2)).to be_a Position
    end

    it 'should return an instance of Position when command matches LEFT pattern' do
      instance = HandleInput.new(Robot.new, Table.new, Action.new)
      command1 = 'PLACE 1,2,NORTH'
      command2 = 'LEFT'

      instance.interpret(command1)

      expect(instance.interpret(command2)).to be_a Position
    end

    it 'should return an instance of Position when command matches RIGHT pattern' do
      instance = HandleInput.new(Robot.new, Table.new, Action.new)
      command1 = 'PLACE 1,2,NORTH'
      command2 = 'RIGHT'

      instance.interpret(command1)

      expect(instance.interpret(command2)).to be_a Position
    end

    it 'should return an instance of Position when command matches REPORT pattern' do
      instance = HandleInput.new(Robot.new, Table.new, Action.new)
      command1 = 'PLACE 1,2,NORTH'
      command2 = 'REPORT'

      instance.interpret(command1)

      expect(instance.interpret(command2)).to be_a Position
    end
  end

  describe '#next_position' do
    it 'should return an instance of Position' do
      instance = HandleInput.new(Robot.new, Table.new, Action.new)
      position = Position.new(0, 0, 'NORTH')
      command = 'MOVE'

      expect(instance.send(:next_position, position, command)).to be_a Position
    end
  end

  describe '#exec' do
    it 'should return an instance of Position if position is a valid table position' do
      instance = HandleInput.new(Robot.new, Table.new, Action.new)
      position = Position.new(0, 0, 'NORTH')

      expect(instance.send(:exec, position)).to be_a Position
    end

    it 'should return nil if position is not a valid table position' do
      instance = HandleInput.new(Robot.new, Table.new, Action.new)
      position = Position.new(0, 6, 'NORTH')

      expect(instance.send(:exec, position)).to be_nil
    end
  end
end
