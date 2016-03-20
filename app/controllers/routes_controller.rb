class RoutesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @routes = Route.joins(:user).where(nil)
    @routes = @routes.with_full_text_search(params[:search]) if params[:search].present?
    @routes = @routes.order(sort_column + " " + sort_direction)
    @routes = @routes.active_routes
  end

  def show
    @route = Route.includes(comments: :user).find(params[:id])
    @comment = Comment.new
    @comments = @route.comments.most_recent
  end

  def new
    @route = Route.new
    authorize @route
    @setters = User.setters
    @grades = Route.grades.keys
    @locations = {
      "McAlexander" => "McAlexander",
      "Dixon"       => "Dixon"
    }
  end

  def edit
    @route = Route.find(params[:id])
    @setters = User.setters
    @grades = Route.grades.keys
    @locations = {
      "McAlexander" => "McAlexander",
      "Dixon"       => "Dixon"
    }
  end

  def create
    @route = Route.new
    authorize(@route)
    @route.expiration_date = Date.strptime(params[:route][:route_set_date], "%Y-%m-%d") + 3.months
    if @route = Route.create(create_route_params)
      redirect_to action: "index"
    else
      render "new"
    end
  end

  def update
    @route = Route.find(params[:id])
    authorize @route
    if @route.update(update_route_params)
      redirect_to @route
    else
      render "edit"
    end
  end

  private

  def update_route_params
    params.require(:route).permit(:name, :user_id, :label, :location, :tape_color, :grade, :route_set_date, :image_1, :image_2)
  end

  def create_route_params
    params.permit(:name, :user_id, :label, :location, :tape_color, :grade, :route_set_date, :image_1, :image_2)
  end

  def sort_column
    whitelist = %w(name users.first_name location tape_color
      grade route_set_date expiration_date)
    whitelist.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
