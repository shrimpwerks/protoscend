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
        data: Route.active_routes.location('Dixon').count
        # data: [["5.9", 10], ["5.11", 16], ["5.13", 28]]
      },
      {
        name: "Inactive",
        data: [["5.9", 24], ["5.11", 22], ["5.13", 19]]
      },
      {
        name: "Assigned",
        data: [["5.9", 20], ["5.11", 23], ["5.13", 29]]
      }
    ]

    @chart2 = [
      {
        name: "Fantasy & Sci Fi",
        data: [["2010", 10], ["2020", 16], ["2030", 28]]
      },
      {
        name: "Romance",
        data: [["2010", 24], ["2020", 22], ["2030", 19]]
      },
      {
        name: "Mystery/Crime",
        data: [["2010", 20], ["2020", 23], ["2030", 29]]
      }
    ]
  end

  def create
    authorize(Route.new)
    @route = Route.assigned_routes.create(assigned_route_params)
    redirect_to action: "index"
  end

  private

  def assigned_route_params
    params.permit(:location, :grade, :user_id)
  end
end
