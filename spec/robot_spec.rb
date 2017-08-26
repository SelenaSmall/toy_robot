require 'rspec'
require 'spec_helper'
require './lib/robot'

describe Robot do
  describe '#initialize' do
    it 'should have a current_position attribute which is nil' do
      instance = Robot.new

      expect(instance.position).to be_nil
    end
  end

  describe '#place' do
    it 'should return an instance of Position' do
      instance = Robot.new

      expect(instance.place(0, 0, 'NORTH')).to be_a Position
    end
  end

  describe '#update_robot' do
    it 'should return an instance of Position' do
      instance = Robot.new
      new_position = Position.new(0, 1, 'NORTH')

      expect(instance.update_robot(new_position)).to be_a Position
    end

    it 'should return false if new_position is nil' do
      instance = Robot.new
      new_position = nil

      expect(instance.update_robot(new_position)).to be_nil
    end
  end

  describe '#not_in_place?' do
    it 'should return true if position attribute is nil' do
      instance = Robot.new

      expect(instance.not_in_place?).to be true
    end
  end
end
