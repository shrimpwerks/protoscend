module Admin
  class AnnouncementsController < ApplicationController
    helper_method :sort_column, :sort_direction
    before_action :set_announcement, only: [:show, :edit, :update, :destroy]
    before_action :new_announcement, only: [:new, :create, :index]

    def index
      @announcements = Announcement.joins(:user).active_announcements.not_expired.order(reveal_date: :desc)
      @announcements = @announcements.with_full_text_search(params[:search]) if params[:search].present?
      @announcements = @announcements.order(sort_column + " " + sort_direction)
      @announcements = @announcements.page(params[:page])
    end

    def new
      @announcement.reveal_date = Date.today
      @announcement.expires_at = Date.today + 1.months
    end

    def create
      @announcement = Announcement.new(announcement_params)
      @announcement.user_id = current_user.id

      if @announcement.save
        redirect_to action: "index"
      else
        render "new"
      end
    end

    def show
    end

    def edit
    end

    def update
      @announcement.update(announcement_params)
      if @announcement.save
        flash[:success] = "Successfully modified and saved announcement."
        redirect_to action: "index"
      else
        flash[:danger] = "Could not modify announcement information."
        render :edit
      end
    end

    def destroy
      @announcement.status = "inactive"
      if @announcement.save
        flash[:success] = "Successfully disabled announcement."
        redirect_to action: "index"
      else
        flash[:danger] = "Could not disable announcement."
        render :show
      end
    end

    private

    def new_announcement
      @announcement = Announcement.new
      authorize @announcement
    end

    def set_announcement
      @announcement = Announcement.find(params[:id])
      authorize @announcement
    end

    def announcement_params
      params.require(:announcement).permit(:subject, :body, :created_at, :expires_at,
                                           :user_id, :reveal_date)
    end

    def sort_column
      whitelist = %w(subject users.first_name body reveal_date expires_at created_at updated_at)
      whitelist.include?(params[:sort]) ? params[:sort] : "subject"
    end

    def sort_direction
      %w(asc desc).include?(params[:direction]) ? params[:direction] : "asc"
    end
  end
end
