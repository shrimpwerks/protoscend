class ApplicationController < ActionController::Base
  layout "public"

  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  unless Rails.application.config.consider_all_requests_local
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
    rescue_from ActionController::RoutingError, :with => :route_not_found
  end

  private

  def user_not_authorized
    flash[:danger] = "You are not authorized to perform this action."
    redirect_to root_path
  end

  def record_not_found
    flash[:danger] = "The requested record could not be found."
    redirect_to root_path
  end

  def route_not_found
    flash[:danger] = "The requested page does not exist."
    redirect_to root_path
  end
end
