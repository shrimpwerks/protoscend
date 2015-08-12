class Api::AssignedRouteController < ApplicationController
  protect_from_forgery with: :exception
  respond_to :json

  def show
    @route = AssignedRoute.find(params[:id])
    render json: @route.to_json
  end

  def index
    @routes = AssignedRoute.limit(5).offset(params[:offset])
    render json: @routes.to_json
  end
end
