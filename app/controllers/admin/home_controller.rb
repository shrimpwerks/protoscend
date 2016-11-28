module Admin
  class HomeController < ApplicationController
    def index
      @announcements = Announcement.not_expired.recent_first
      @top_setters = User.top_setters
    end
  end
end
