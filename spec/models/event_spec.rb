require 'spec_helper'

describe Event do

  describe "Valid event" do
    it "should create a new instance given a valid attribute" do
      FactoryGirl.create(:event)
    end

    it "should create a new instance with one subscriber" do
      event = FactoryGirl.create(:event_with_subscribers)
      event.subscribers.should have(1).items
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

  describe "Talks" do

    it "retreives its talks" do
      event = FactoryGirl.create :event
      talks = FactoryGirl.create_list :talk, 5
      event.talks << talks
      event.talks.should eq(talks)
    end

  end

  describe "Subscribers" do

    it "retreives its subscribers" do
      event = FactoryGirl.create :event
      subscribers = FactoryGirl.create_list :user, 5
      event.subscribers << subscribers
      event.subscribers.should eq(subscribers)
    end

  end

end
