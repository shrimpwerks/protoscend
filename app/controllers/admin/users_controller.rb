module Admin
  class UsersController < ApplicationController
    helper_method :sort_column, :sort_direction

    def index
      @user = User.new
      authorize @user

      @users = User.where(nil)
      @users = @users.with_full_text_search(params[:search]) if params[:search].present?
      @users = @users.where(hidden: nil)
      @users = @users.order(sort_column + " " + sort_direction)
      @users = @users.page(params[:page])
    end

    def show
      @user = User.find(params[:id])
      @assigned_routes = @user.routes.assigned_routes
    end

    def edit
      @user = User.find(params[:id])
      authorize @user
    end

    def update
      @user = User.find(params[:id])
      authorize @user

      @user.update_attributes!(user_params)

      redirect_to controller: "admin/users", action: "index"
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :role)
    end

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
    end

    def sort_direction
      %w(asc desc).include?(params[:direction]) ?  params[:direction] : "asc"
    end
  end
end
