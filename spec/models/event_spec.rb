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

    it "returns past events" do
      events = FactoryGirl.create_list :event, 3
      past_event = FactoryGirl.create :past_event
      Event.past.should include past_event
    end

    it "doesn't return future events" do
      past_events = FactoryGirl.create_list :past_event, 3
      future_event = FactoryGirl.create :future_event
      Event.past.should_not include future_event
    end
  end

  describe "Next event" do
    it "should create a new instance with future starts_at" do
      event = FactoryGirl.create(:future_event)
      event.starts_at.future?.should be_true
    end

    it "returns next event when only one future event" do
      past_events = FactoryGirl.create_list :past_event, 3
      next_event = FactoryGirl.create :future_event
      Event.next.should eq(next_event)
    end

    it "returns next event when several future events" do
      next_events = []
      5.times do |i|
        event = FactoryGirl.create(:event, starts_at: i.day.from_now)
        next_events << event
      end
      Event.next.should eq(next_events.first)
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
