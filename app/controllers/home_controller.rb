class HomeController < ApplicationController
  def index
    @announcements = Announcement.not_expired.chronological
    @newest_routes = Route.newest_routes
    @top_routes = Route.top_routes
  end
end
