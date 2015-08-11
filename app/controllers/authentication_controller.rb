class AuthenticationController < ApplicationController
  def create
    user_password = params[:password]
    user_email = params[:email]
    # user_password = params[:session][:password]
    # user_email = params[:session][:email]

    @user = user_email.present? && User.find_by(email: user_email)

    if @user.valid_password? user_password
      # sign_in @user, store: false
      @user.generate_authentication_token!
      @user.save
      render json: @user, meta: { status: 200 }
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end

  def destroy
    current_user.destroy
    head 204
  end
end
