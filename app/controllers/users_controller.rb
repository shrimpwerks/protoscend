class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @users = User.where(nil)
    @users = @users.with_full_text_search(params[:search]) if params[:search].present?
    @users = @users.order(sort_column + " " + sort_direction)
  end

  def show
    @user = User.find(params[:id])
    @assigned_routes = @user.routes.assigned_routes
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
    @user.update_attributes!(user_role_update)

    # TODO: This needs to check for user_level OR current user
    # NOTE: This may be exported to an admin interface
    @user.update_attributes!(user_password_update) if params[:user][:password].present?

    @user.update_attributes!(user_basic_info_update)

    redirect_to @user
  end

  private

  def user_basic_info_update
    params.require(:user).permit(:email, :first_name, :last_name)
  end

  def user_role_update
    params.require(:user).permit(:role)
  end

  def user_password_update
    params.require(:user).permit(:password)
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
