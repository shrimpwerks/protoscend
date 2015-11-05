class Api::AuthenticationController < ApplicationController
  # Pulling inspiration from the ember-simple-auth-devise setup 
  # https://github.com/simplabs/ember-simple-auth/tree/master/packages/ember-simple-auth-devise#server-side-setup
  def create
    @user = User.find_by_email(params[:email]) if params[:email].present? 

    if @user && @user.valid_password?(params[:password])
      # generate auth token for user table
      @user.generate_authentication_token!
      @user.save

      data = {
        id: @user.id,
        auth_token: @user.auth_token,
        user_level: @user.user_level
      }

      render json: data, status: 200
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end

  def destroy
    # sign_out current_user
    head 204
  end
end
