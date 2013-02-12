require 'spec_helper'

describe Pixelletter do
  it 'should have the right ENV variables' do
    ENV['EMAIL'].should == 'info@ikusei.de'
  end
end