class AssignedRoutesController < ApplicationController
  before_action :set_route, only: [:edit, :update]
  before_action :new_route, only: [:create]

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
    # @route = Route.new(create_assigned_route_params)
    @route = AssignedRouteForm.new(Route.new(create_assigned_route_params))
    @route.status = 1
    if @route.save
      flash[:success] = "Successfully assigned route."
      redirect_to action: "index"
    else
      flash[:danger] = "Could not assign route."
      redirect_to request.referer
    end
  end

  def edit
  end

  def update
    @route.update(complete_assigned_route_params)
    @route = RouteForm.new(@route)
    @route.status = 0
    @route.expiration_date = Date.strptime(params[:route][:route_set_date], "%Y-%m-%d") + 3.months

    if @route.save
      flash[:success] = "Successfully completed assigned route."
      redirect_to @route
    else
      flash[:danger] = "Could not complete route assignment."
      render "edit"
    end
  end

  private

  def new_route
    @route = Route.new
    authorize @route
  end

  def set_route
    @route = Route.find(params[:id])
    authorize @route
  end

  def create_assigned_route_params
    params.permit(:location, :grade, :user_id)
  end

  def complete_assigned_route_params
    params.require(:route).permit(:name, :label, :tape_color, :route_set_date, :image_1, :image_2)
  end
end
