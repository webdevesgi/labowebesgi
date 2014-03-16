require 'spec_helper'

describe EventsController do

  describe "GET index" do
    it "assigns all events as @events ordered by starts_at DESC" do
      event = FactoryGirl.create(:event)
      get :index
      assigns(:events).should eq(Event.all.order('starts_at DESC'))
    end
  end

  describe "GET past" do
    it "renders only past events" do
      FactoryGirl.create_list(:event, 5)
      correct_number = 2
      past_events = FactoryGirl.create_list(:past_event, correct_number)
      get :past
      assigned_events = assigns(:events)
      assigned_events.length.should eq(correct_number)
      assigned_events.should eq(past_events)
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      event = FactoryGirl.create(:event)
      get :show, {id: event.to_param}
      assigns(:event).should eq(event)
    end
  end

  describe "GET next" do
    it "assigns the requested event as @event" do
      event = FactoryGirl.create(:future_event)
      get :show, {id: event.to_param}
      assigns(:event).should eq(event)
    end
  end

end
