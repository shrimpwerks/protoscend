class UserController < ApplicationController
  protect_from_forgery with: :exception
  respond_to :json

  def show
    @user = User.find(params[:id])
    render json: @user.to_json
  end

  def index
    @users_count = User.count
    @users = User.list_users(params)

    render json: @users, meta: { count: @users_count }
  end
end
