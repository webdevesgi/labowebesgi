class HomeController < ApplicationController
  def index
    @articles = Article.includes(:user).order('created_at DESC').first(3)
    @next_event = Event.next
  end
end
