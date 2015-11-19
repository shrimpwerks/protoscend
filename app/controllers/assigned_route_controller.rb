class AssignedRouteController < ApplicationController

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def show
  end

  def index
    @assigned_route = AssignedRoute.new
    @routes = AssignedRoute.joins(:user)
    @setters = User.where('user_level > 0').order(:fname)
    @setters.each do |setter|
      setter.full_name = setter.fname + " " + setter.lname
    end
    @gyms = {
      "McAlexander" => "McAlexander",
      "Dixon"       => "Dixon"
    }
    @grades = {
      "5.6"   => "5.6",
      "5.7"   => "5.7",
      "5.8"   => "5.8",
      "5.9"   => "5.9",
      "5.10-" => "5.10-",
      "5.10"  => "5.10",
      "5.10+" => "5.10+",
      "5.11-" => "5.11-",
      "5.11"  => "5.11",
      "5.11+" => "5.11+",
      "5.12-" => "5.12-",
      "5.12"  => "5.12",
      "5.12+" => "5.12+"
    }
  end

  def create
    @assigned_route = AssignedRoute.new
    authorize(@assigned_route)
    @assigned_route = AssignedRoute.create(assigned_route_params)
    redirect_to action: "index"
  end

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action"

    redirect_to request.referrer || root_path
  end

  def assigned_route_params
    params.permit(:gym, :grade, :user_id)
  end
end
