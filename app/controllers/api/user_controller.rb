class Api::UserController < ApplicationController
  # protect_from_forgery with: :exception
  before_action :authenticate_with_token!, :except => [:create]
  respond_to :json

  def show
    @user = User.find(params[:id])
    render json: @user.to_json
  end

  def index
    @users = User.where(nil)
    @users.search_fname(params[:s_fname]) if params[:s_fname].present?
    @users.search_lname(params[:s_lname]) if params[:s_lname].present?
    @users.search_email(params[:s_email]) if params[:s_email].present?

    render json: @users, meta: { count: @users.length }
  end

  def create
    if params[:password] != params[:password_confirm]
      render json: { :errors => { password: ['Your passwords do not match']}}, :status => 422
    else
      user = User.new
      user.email = params[:email]
      user.fname = params[:fname]
      user.lname = params[:lname]
      user.password = params[:password]
      user.user_level = 0
      user.hidden = 0
      user.generate_authentication_token!
      user.save

      if user.errors.any?
        render json: {
          errors: user.errors
        }, :status => 422
      else
        render json: {
          :success => 'Successfully created user'
        }, :status => 200
      end
    end
  end
end
