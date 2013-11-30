require 'spec_helper'

describe Event do

  describe "Valid event" do
    it "should create a new instance given a valid attribute" do
      FactoryGirl.create(:event)
    end
  end

  describe "Past event" do
    it "should create a new instance with past starts_at" do
      event = FactoryGirl.create(:past_event)
      event.starts_at.past?.should be_true
    end
  end

  describe "Future event" do
    it "should create a new instance with future starts_at" do
      event = FactoryGirl.create(:future_event)
      event.starts_at.past?.should be_false
    end
  end

end
