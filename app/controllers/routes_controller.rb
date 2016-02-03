class RoutesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @routes = Route.joins(:user).where(nil)
    @routes = @routes.with_full_text_search(params[:search]) if params[:search].present?
    @routes = @routes.order(sort_column + " " + sort_direction)
    @routes = @routes.active_routes
  end

  def show
    @route = Route.find(params[:id])
  end

  def new
    @route = Route.new
    authorize @route
    @setters = User.get_setters
    @locations = {
      "McAlexander" => "McAlexander",
      "Dixon"       => "Dixon"
    }
    @grades = Route.grades.keys
  end

  def create
    @route = Route.new
    authorize(@route)
    @route = Route.create(route_params)
    redirect_to action: "index"
  end

  def update
    @route = Route.find(params[:id])
    authorize @route
    @route.status = 0
    @route.expiration_date = Date.strptime(params[:route][:route_set_date], "%Y-%m-%d") + 3.months
    @route.update(complete_assigned_route)

    redirect_to @route
  end

  private

  def complete_assigned_route
    params.require(:route).permit(:name, :label, :tape_color, :route_set_date, :image_1, :image_2)
  end

  def route_params
    params.permit(:name, :user_id, :label, :location, :tape_color, :grade, :route_set_date, :image_1, :image_2)
  end

  def sort_column
    whitelist = %w(name users.fname location tape_color
      grade route_set_date expiration_date)
    whitelist.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
