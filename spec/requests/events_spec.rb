require 'spec_helper'

describe "Events" do
  describe "GET /events" do
    it "works" do
      get events_path
      response.status.should be(200)
    end
  end

  describe "GET /events/past" do
    it "works" do
      get past_events_path
      response.status.should be(200)
    end
  end

  describe "GET /events/next" do
    it "works" do
      get next_events_path
      response.status.should be(200)
    end
  end
end
