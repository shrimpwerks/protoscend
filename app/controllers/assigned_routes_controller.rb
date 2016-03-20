class AssignedRoutesController < ApplicationController

  def show
  end

  def index
    @assigned_route = Route.new
    @routes = Route.assigned_routes
    @setters = User.setters

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
    if @route = Route.assigned_routes.create(create_assigned_route_params)
      redirect_to action: "index"
    else
      render "index"
    end
  end

  def edit
    @route = Route.find(params[:id])
    authorize @route
  end

  def update
    @route = Route.find(params[:id])
    authorize @route
    @route.status = 0
    @route.expiration_date = Date.strptime(params[:route][:route_set_date], "%Y-%m-%d") + 3.months

    if @route.update(complete_assigned_route_params)
      redirect_to @route
    else
      render "edit"
    end
  end

  private

  def create_assigned_route_params
    params.permit(:location, :grade, :user_id)
  end

  def complete_assigned_route_params
    params.require(:route).permit(:name, :label, :tape_color, :route_set_date, :image_1, :image_2)
  end
end
