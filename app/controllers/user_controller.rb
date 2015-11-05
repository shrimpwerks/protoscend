class UserController < ApplicationController
  helper_method :sort_column, :sort_direction

<<<<<<< HEAD
  def show
    @user_id = params[:id]
    @user = User.find(params[:id])
  end

  def edit
    @user_id = params[:id]
    @user = User.find(params[:id])
=======
  def index
    @users = User.where(nil)
    @users = @users.with_first_name(params[:first_name]) if params[:first_name].present?
    @users = @users.with_last_name(params[:last_name]) if params[:last_name].present?
    @users = @users.with_email(params[:email]) if params[:email].present?
    @users = @users.order(sort_column + " " + sort_direction) 
>>>>>>> f2db2045b9019ed802e328dc1836284b6faad20e
  end

  def show
  end

  def new
  end

  private
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
