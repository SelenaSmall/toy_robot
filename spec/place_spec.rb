require 'rspec'
require 'spec_helper'
require './lib/actions/place'

describe Place do
  describe '#initialize' do
    it 'should have a robot attribute which is nil' do
      instance = Place.new(@robot, @table)

      expect(instance.robot).to be_nil
    end

    it 'should have a table attribute which is nil' do
      instance = Place.new(@robot, @table)

      expect(instance.table).to be_nil
    end
  end
end
