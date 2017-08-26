require 'rspec'
require 'spec_helper'
require './lib/direction'

describe Direction do
  describe '#initialize' do
    it 'should have a start_direction attribute which is a String' do
      instance = Direction.new('NORTH')

      expect(instance.start_direction).to be_a String
    end
  end

  describe '#turn_right' do
    it 'should return the next value in the directions array' do
      instance = Direction.new('NORTH')
      current_direction = 'NORTH'

      expect(instance.turn_right(current_direction)).to be_a String
      expect(instance.turn_right(current_direction)).to eq 'EAST'
    end

    it 'should return nil if the current_direction is empty' do
      instance = Direction.new('NORTH')
      current_direction = ''

      expect(instance.turn_right(current_direction)).to be_nil
    end
  end
end
