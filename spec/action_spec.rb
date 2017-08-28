require 'rspec'
require 'spec_helper'
require './lib/action'

describe Action do
  describe '#initialize' do
    it 'should have a current_position attribute which is nil' do
      instance = Action.new(@robot)

      expect(instance.robot).to be_nil
    end
  end

  describe '#place' do
    it 'should return an instance of Position' do
      instance = Action.new(@robot)
      command = 'PLACE 0,0,NORTH'

      expect(instance.place(command)).to be_a Position
    end
  end

  describe '#move' do
    it 'should return an instance of Position' do
      instance = Action.new(@robot)
      position = Position.new(0, 0, 'NORTH')

      expect(instance.move(position)).to be_a Position
    end
  end

  describe '#left' do
    it 'should return an instance of Position' do
      instance = Action.new(@robot)
      position = Position.new(0, 0, 'NORTH')

      expect(instance.left(position)).to be_a Position
    end
  end

  describe '#right' do
    it 'should return an instance of Position' do
      instance = Action.new(@robot)
      position = Position.new(0, 0, 'NORTH')

      expect(instance.right(position)).to be_a Position
    end
  end

  describe '#report' do
    it 'should return nil' do
      instance = Action.new(@robot)
      position = Position.new(0, 0, 'NORTH')

      expect(instance.report(position)).to be_nil
    end
  end

  describe '#prev_option' do
    it 'should return the previous value in the OPTIONS array' do
      instance = Action.new(@robot)

      expect(instance.send(:prev_option, 'NORTH')).to be_a String
      expect(instance.send(:prev_option, 'NORTH')).to eq 'WEST'
    end

    it 'should return nil if the direction param is empty' do
      instance = Action.new(@robot)

      expect(instance.send(:prev_option, '')).to be_nil
    end
  end

  describe '#next_option' do
    it 'should return the next value in the OPTIONS array' do
      instance = Action.new(@robot)

      expect(instance.send(:next_option, 'NORTH')).to be_a String
      expect(instance.send(:next_option, 'NORTH')).to eq 'EAST'
    end

    it 'should return nil if the direction param is empty' do
      instance = Action.new(@robot)

      expect(instance.send(:next_option, '')).to be_nil
    end
  end
end
