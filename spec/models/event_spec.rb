require 'spec_helper'

describe Event do
  it "should create a new instance given a valid attribute" do
    FactoryGirl.create(:event)
  end

  it "should create a new instance with past starts_at datetime attribute" do
    event = FactoryGirl.create(:past_event)
    event.starts_at.past?.should be_true
  end
end
