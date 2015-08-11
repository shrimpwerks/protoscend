class UserController < ApplicationController
  # protect_from_forgery with: :exception
  # before_action :authenticate_with_token!
  respond_to :json

  def show
    @user = User.find(params[:id])
    render json: @user.to_json
  end

  def index
    @users_count = User.count
    @users = User.list_users(params)
    @users = @users.offset_by(params) if params[:offset].present?
    @users = @users.order_by(params) if params[:sort_by].present?
    @users = @users.search_fname(params[:s_fname]) if params[:s_fname].present?
    @users = @users.search_lname(params[:s_lname]) if params[:s_lname].present?
    @users = @users.search_email(params[:s_email]) if params[:s_email].present?

    render json: @users, meta: { count: @users_count }
  end
end
