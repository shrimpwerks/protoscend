class HomeController < ApplicationController
  def index
    @announcements = Announcement.not_expired.recent_first
    @newest_routes = Route.newest_routes
    @top_routes = Route.top_routes
  end
end
