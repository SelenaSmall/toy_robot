require 'rspec'
require 'spec_helper'
require './lib/action'

describe Action do
  describe '#place' do
    it 'should return an instance of Position' do
      instance = Action.new
      command = 'PLACE 0,0,NORTH'

      expect(instance.place(command)).to be_a Position
    end
  end

  describe '#move' do
    it 'should return an instance of Position' do
      instance = Action.new
      position = Position.new(0, 0, 'NORTH')

      expect(instance.move(position)).to be_a Position
    end
  end

  describe '#left' do
    it 'should return an instance of Position' do
      instance = Action.new
      position = Position.new(0, 0, 'NORTH')

      expect(instance.left(position)).to be_a Position
    end
  end

  describe '#right' do
    it 'should return an instance of Position' do
      instance = Action.new
      position = Position.new(0, 0, 'NORTH')

      expect(instance.right(position)).to be_a Position
    end
  end

  describe '#report' do
    it 'should return an instance of Position' do
      instance = Action.new
      position = Position.new(0, 0, 'NORTH')

      expect(instance.right(position)).to be_a Position
    end
  end

  describe '#prev_option' do
    it 'should return the last value in the OPTIONS array' do
      instance = Action.new

      expect(instance.send(:prev_option, 'WEST')).to be_a String
      expect(instance.send(:prev_option, 'WEST')).to eq 'SOUTH'
    end

    it 'should return the previous value in the OPTIONS array' do
      instance = Action.new

      expect(instance.send(:prev_option, 'NORTH')).to be_a String
      expect(instance.send(:prev_option, 'NORTH')).to eq 'WEST'
    end

    it 'should return the previous value in the OPTIONS array' do
      instance = Action.new

      expect(instance.send(:prev_option, 'EAST')).to be_a String
      expect(instance.send(:prev_option, 'EAST')).to eq 'NORTH'
    end

    it 'should return the previous value in the OPTIONS array' do
      instance = Action.new

      expect(instance.send(:prev_option, 'SOUTH')).to be_a String
      expect(instance.send(:prev_option, 'SOUTH')).to eq 'EAST'
    end

    it 'should return nil if the direction param is empty' do
      instance = Action.new

      expect(instance.send(:prev_option, '')).to be_nil
    end
  end

  describe '#next_option' do
    it 'should return the next value in the OPTIONS array' do
      instance = Action.new

      expect(instance.send(:next_option, 'WEST')).to be_a String
      expect(instance.send(:next_option, 'WEST')).to eq 'NORTH'
    end

    it 'should return the next value in the OPTIONS array' do
      instance = Action.new

      expect(instance.send(:next_option, 'NORTH')).to be_a String
      expect(instance.send(:next_option, 'NORTH')).to eq 'EAST'
    end

    it 'should return the next value in the OPTIONS array' do
      instance = Action.new

      expect(instance.send(:next_option, 'EAST')).to be_a String
      expect(instance.send(:next_option, 'EAST')).to eq 'SOUTH'
    end

    it 'should return the first value in the OPTIONS array' do
      instance = Action.new

      expect(instance.send(:next_option, 'SOUTH')).to be_a String
      expect(instance.send(:next_option, 'SOUTH')).to eq 'WEST'
    end

    it 'should return nil if the direction param is empty' do
      instance = Action.new

      expect(instance.send(:next_option, '')).to be_nil
    end
  end
end
