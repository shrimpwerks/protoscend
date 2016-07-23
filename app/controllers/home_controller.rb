class HomeController < ApplicationController
  def index
    @announcements = Announcement.all
    @newest_routes = Route.newest_routes
    @top_routes = Route.top_routes
  end
end
