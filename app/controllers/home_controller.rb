class HomeController < ApplicationController
  def index
    @announcements = Announcement.all
  end
end
