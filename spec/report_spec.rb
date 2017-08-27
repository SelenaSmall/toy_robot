require 'rspec'
require 'spec_helper'
require './lib/actions/report'

describe Report do
  describe '#initialize' do
    it 'should have a robot attribute which is nil' do
      instance = Report.new(@robot)

      expect(instance.robot).to be_nil
    end
  end
end
