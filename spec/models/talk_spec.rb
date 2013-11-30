require 'spec_helper'

describe Talk do
  it "should create a new instance given a valid attribute" do
    FactoryGirl.create(:talk)
  end
end
