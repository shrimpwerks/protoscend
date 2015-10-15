class UserController < ApplicationController
  # protect_from_forgery with: :exception
  # before_action :authenticate_with_token!

  def show
    @user_id = params[:id]
    @user = User.find(params[:id])
  end

  def edit
    @user_id = params[:id]
    @user = User.find(params[:id])
  end

  def index
  end

  def new
  end
end
