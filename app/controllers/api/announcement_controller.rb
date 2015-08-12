class Api::AnnouncementController < ApplicationController
  protect_from_forgery with: :exception
  respond_to :json

  def show
    @announcement = Announcement.find(params[:id])
    render json: @announcement.to_json
  end

  def index
    @announcement = Announcement.last(1)
    # @announcements = Announcement.limit(5).offset(params[:offset])
    render json: @announcement.to_json
  end
end
