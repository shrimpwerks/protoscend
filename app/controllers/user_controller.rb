class UserController < ApplicationController
  helper_method :sort_column, :sort_direction

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @users = User.where(nil)
    @users = @users.with_full_text_search(params[:search]) if params[:search].present?
    @users = @users.order(sort_column + " " + sort_direction)
  end

  def show
    @user = User.find(params[:id])
    @assigned_routes = @user.assigned_routes.not_complete.not_hidden
  end

  def new
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user

    # TODO: This needs to check for user_level.
    # NOTE: This may be exported to an admin interface.
    @user.update_attributes!(user_level_update)

    # TODO: This needs to check for user_level OR current user
    # NOTE: This may be exported to an admin interface
    @user.update_attributes!(user_password_update) if params[:user][:password].present?

    @user.update_attributes!(user_basic_info_update)

    redirect_to @user
  end

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action"

    redirect_to request.referrer || root_path
  end

  def user_basic_info_update
    params.require(:user).permit(:email, :fname, :lname)
  end

  def user_level_update
    params.require(:user).permit(:user_level)
  end

  def user_password_update
    params.require(:user).permit(:password)
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
