class RoutesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @routes = Route.joins(:user).where(nil)
    @routes = @routes.with_full_text_search(params[:search]) if params[:search].present?
    @routes = @routes.order(sort_column + " " + sort_direction)
  end

  def show
    @route = Route.find(params[:id])
  end

  def new
  end

  private

  def sort_column
    whitelist = %w(name users.fname location tape_color
      grade route_set_date expiration_date)
    whitelist.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
