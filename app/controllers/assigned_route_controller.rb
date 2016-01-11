class AssignedRouteController < ApplicationController

  def show
  end

  def index
    @assigned_route = AssignedRoute.new
    @routes = AssignedRoute.with_users
    @setters = User.get_setters

    # TODO: change these to enums
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

  def assigned_route_params
    params.permit(:gym, :grade, :user_id)
  end
end
