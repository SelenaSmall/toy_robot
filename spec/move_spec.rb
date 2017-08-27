require 'rspec'
require 'spec_helper'
require './lib/actions/move'

describe Move do
  describe '#initialize' do
    it 'should have a robot attribute which is nil' do
      instance = Move.new(@robot, @table)

      expect(instance.robot).to be_nil
    end

    it 'should have a table attribute which is nil' do
      instance = Move.new(@robot, @table)

      expect(instance.table).to be_nil
    end
  end
end
