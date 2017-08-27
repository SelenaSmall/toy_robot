require 'rspec'
require 'spec_helper'
require './lib/table'

describe Table do
  describe '#initialize' do
    it 'should have an x attribute which is a Range' do
      instance = Table.new

      expect(instance.x).to be_a Range
      expect(instance.x).to eq 0..4
    end

    it 'should have a y attribute which is a Range' do
      instance = Table.new

      expect(instance.y).to be_a Range
      expect(instance.y).to eq 0..4
    end
  end

  describe '#valid_position?' do
    it 'should return true when x and y attributes are valid' do
      instance = Table.new
      position = Position.new(0, 0, 'NORTH')

      expect(instance.valid_position?(position)).to be true
    end

    it 'should return false when x and y attributes are too big' do
      instance = Table.new
      position = Position.new(6, 6, 'NORTH')

      expect(instance.valid_position?(position)).to be false
    end

    it 'should return false when x attribute is too big' do
      instance = Table.new
      position = Position.new(6, 0, 'NORTH')

      expect(instance.valid_position?(position)).to be false
    end

    it 'should return false when y attribute is too big' do
      instance = Table.new
      position = Position.new(0, 6, 'NORTH')

      expect(instance.valid_position?(position)).to be false
    end

    it 'should return false when x and y attributes are negative' do
      instance = Table.new
      position = Position.new(-1, -1, 'NORTH')

      expect(instance.valid_position?(position)).to be false
    end

    it 'should return false when x attribute is negative' do
      instance = Table.new
      position = Position.new(-2, 0, 'NORTH')

      expect(instance.valid_position?(position)).to be false
    end

    it 'should return false when y attribute is negative' do
      instance = Table.new
      position = Position.new(0, -2, 'NORTH')

      expect(instance.valid_position?(position)).to be false
    end
  end
end
