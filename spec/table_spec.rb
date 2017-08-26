require 'rspec'
require 'spec_helper'
require './lib/table'

describe Table do
  describe '#initialize' do
    it 'should have an x attribute which is an integer' do
      instance = Table.new

      expect(instance.x).to be_a Integer
      expect(instance.x).to eq 5
    end

    it 'should have a y attribute which is an integer' do
      instance = Table.new

      expect(instance.y).to be_a Integer
      expect(instance.y).to eq 5
    end
  end

  describe '#valid_position?' do
    it 'should return true when x and y attributes are valid' do
      instance = Table.new

      expect(instance.valid_position?(0, 1)).to be true
    end

    it 'should return false when x and y attributes are too big' do
      instance = Table.new

      expect(instance.valid_position?(6, 6)).to be false
    end

    it 'should return false when x attribute is too big' do
      instance = Table.new

      expect(instance.valid_position?(6, 0)).to be false
    end

    it 'should return false when y attribute is too big' do
      instance = Table.new

      expect(instance.valid_position?(0, 6)).to be false
    end

    it 'should return false when x and y attributes are negative' do
      instance = Table.new

      expect(instance.valid_position?(-1, -1)).to be false
    end

    it 'should return false when x attribute is negative' do
      instance = Table.new

      expect(instance.valid_position?(-2, 0)).to be false
    end

    it 'should return false when y attribute is negative' do
      instance = Table.new

      expect(instance.valid_position?(0, -2)).to be false
    end
  end

  describe '#valid_x?' do
    it 'should return true when x is not greater than or equal to 0' do
      instance = Table.new

      expect(instance.send(:valid_x?, 0)).to be true
    end

    it 'should return true when x is less than or equal to 4' do
      instance = Table.new

      expect(instance.send(:valid_x?, 4)).to be true
    end

    it 'should return false when x is less 0' do
      instance = Table.new

      expect(instance.send(:valid_x?, -1)).to be false
    end

    it 'should return false when x greater than 4' do
      instance = Table.new

      expect(instance.send(:valid_x?, 6)).to be false
    end
  end

  describe '#valid_y?' do
    it 'should return true when y is not greater than or equal to 0' do
      instance = Table.new

      expect(instance.send(:valid_y?, 0)).to be true
    end

    it 'should return true when y is less than or equal to 4' do
      instance = Table.new

      expect(instance.send(:valid_y?, 4)).to be true
    end

    it 'should return false when y is less 0' do
      instance = Table.new

      expect(instance.send(:valid_y?, -1)).to be false
    end

    it 'should return false when y greater than 4' do
      instance = Table.new

      expect(instance.send(:valid_y?, 6)).to be false
    end
  end
end
