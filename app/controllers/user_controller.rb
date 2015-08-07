class UserController < ApplicationController
  respond_to :json

  def show
    # respond_with User.find(params[:id])
    @user = User.find(params[:id])
    render json: @user.to_json
  end
end
