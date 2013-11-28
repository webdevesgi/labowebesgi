require 'spec_helper'

describe Event do
  it "should create a new instance given a valid attribute" do
    FactoryGirl.create(:event)
  end
end
