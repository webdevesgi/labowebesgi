class EventsController < ApplicationController
  before_action :set_event,          only: [:show, :subscribe]
  before_action :authenticate_user!, only: [:subscribe]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all.order('starts_at DESC')
  end

  # GET /events/past
  # GET /events/past.json
  def past
    @events = Event.past.order('starts_at DESC')
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/next
  # GET /events/next.json
  def next
    @event = Event.next
  end

  # GET /events/1/subscribe
  def subscribe
    @event.subscribers << current_user unless current_user.subscribed_to_event?(@event)
    redirect_to @event, notice: t(:successfully_subscribed, title: @event.title)
  end

  private

    def set_event
      @event = Event.find(params[:id])
      raise ActionController::RoutingError.new('Not Found') if @event.nil?
    end
end
