class Api::AuthenticationController < ApplicationController
  def create
    user_password = params[:password]
    user_email = params[:email]

    @user = user_email.present? && User.find_by(email: user_email)

    if @user.valid_password? user_password
      # sign_in @user, store: false

      # generate auth token for user table
      @user.generate_authentication_token!
      @user.save

      render json: @user, meta: { status: 200 }
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end

  def destroy
    # sign_out current_user
    head 204
  end
end
