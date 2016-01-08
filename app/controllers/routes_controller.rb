class RoutesController < ApplicationController
  helper_method :sort_column, :sort_direction

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @routes = Route.joins(:user).where(nil)
    @routes = @routes.with_full_text_search(params[:search]) if params[:search].present?
    @routes = @routes.order(sort_column + " " + sort_direction)
  end

  def show
    @route = Route.find(params[:id])
  end

  def new
    @route = Route.new
    authorize @route
    @setters = User.get_setters
    @available_walls = AvailableWall.available
    @locations = {
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
    @route = Route.new
    authorize(@route)
    @route = Route.create(route_params)
    AvailableWall.find(params[:available_walls_id]).update_attribute(:available, false)
    redirect_to action: "index"
  end

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action"

    redirect_to request.referrer || root_path
  end

  def route_params
    params.permit(:name, :user_id, :available_walls_id, :location, :tape_color, :grade, :route_set_date, :image_1, :image_2)
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
