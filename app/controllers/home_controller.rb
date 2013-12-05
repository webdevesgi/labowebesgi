class HomeController < ApplicationController
  def index
    @articles = Article.order('created_at DESC').first(3)
    @next_event = Event.next
  end
end
