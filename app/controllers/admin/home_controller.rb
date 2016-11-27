module Admin
  class HomeController < ApplicationController
    def index
      @announcements = Announcement.not_expired
      @top_setters = User.top_setters
    end
  end
end
