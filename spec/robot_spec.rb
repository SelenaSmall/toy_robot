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
end
