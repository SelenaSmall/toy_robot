require 'rspec'
require 'spec_helper'
require './lib/actions/turn'

describe Turn do
  describe '#initialize' do
    it 'should have a robot attribute which is nil' do
      instance = Turn.new(@robot)

      expect(instance.robot).to be_nil
    end
  end

  describe '#prev_option' do
    it 'should return the previous value in the OPTIONS array' do
      instance = Turn.new(@robot)

      expect(instance.send(:prev_option, 'NORTH')).to be_a String
      expect(instance.send(:prev_option, 'NORTH')).to eq 'WEST'
    end

    it 'should return nil if the direction param is empty' do
      instance = Turn.new(@robot)

      expect(instance.send(:prev_option, '')).to be_nil
    end
  end

  describe '#next_option' do
    it 'should return the next value in the OPTIONS array' do
      instance = Turn.new(@robot)

      expect(instance.send(:next_option, 'NORTH')).to be_a String
      expect(instance.send(:next_option, 'NORTH')).to eq 'EAST'
    end

    it 'should return nil if the direction param is empty' do
      instance = Turn.new(@robot)

      expect(instance.send(:next_option, '')).to be_nil
    end
  end
end
