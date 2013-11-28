class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/past
  # GET /events/past.json
  def past
    @events = Event.past
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
  end
end
