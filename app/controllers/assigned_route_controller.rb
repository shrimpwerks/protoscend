class AssignedRouteController < ApplicationController

  def show
  end

  def index
    @assigned_route = Route.new
    @routes = Route.assigned_routes
    @setters = User.get_setters

    @locations = {
      "McAlexander" => "McAlexander",
      "Dixon"       => "Dixon"
    }
    @grades = Route.grades.keys

    @chart1 = [
      {
        name: "Active",
        data: Route.active_routes.location('Dixon').group(:grade).count.map { |key, value| [Route.grades.select { |gkey, gvalue| gvalue == key }.keys.first, value] }
      },
      {
        name: "Expired",
        data: Route.expired_routes.location('Dixon').group(:grade).count.map { |key, value| [Route.grades.select { |gkey, gvalue| gvalue == key }.keys.first, value] }
      },
      {
        name: "Assigned",
        data: Route.assigned_routes.location('Dixon').group(:grade).count.map { |key, value| [Route.grades.select { |gkey, gvalue| gvalue == key }.keys.first, value] }
      }
    ]

    @chart2 = [
      {
        name: "Active",
        data: Route.active_routes.location('McAlexander').group(:grade).count.map { |key, value| [Route.grades.select { |gkey, gvalue| gvalue == key }.keys.first, value] }
      },
      {
        name: "Expired",
        data: Route.expired_routes.location('McAlexander').group(:grade).count.map { |key, value| [Route.grades.select { |gkey, gvalue| gvalue == key }.keys.first, value] }
      },
      {
        name: "Assigned",
        data: Route.assigned_routes.location('McAlexander').group(:grade).count.map { |key, value| [Route.grades.select { |gkey, gvalue| gvalue == key }.keys.first, value] }
      }
    ]
  end

  def create
    authorize(Route.new)
    if @route = Route.assigned_routes.create(assigned_route_params)
      redirect_to action: "index"
    else
      render "index"
    end
  end

  def edit
    @route = Route.find(params[:id])
    authorize @route
  end

  private

  def assigned_route_params
    params.permit(:location, :grade, :user_id)
  end
end
