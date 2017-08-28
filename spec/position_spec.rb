require 'rspec'
require 'spec_helper'
require './lib/position'

describe Position do
  describe '#initialize' do
    it 'should have an x attribute which is an integer' do
      instance = Position.new(0, 0, 'NORTH')

      expect(instance.x).to be_a Integer
      expect(instance.x).to be >= 0
      expect(instance.x).to be <= 4
    end

    it 'should have a y attribute which is an integer' do
      instance = Position.new(0, 0, 'NORTH')

      expect(instance.y).to be_a Integer
      expect(instance.y).to be >= 0
      expect(instance.y).to be <= 4
    end

    it 'should have a f attribute which is a string' do
      instance = Position.new(0, 0, 'NORTH')

      expect(instance.f).to be_a String
      expect(instance.f).to eq 'NORTH'
    end
  end
end
