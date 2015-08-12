class Api::AvailableWallController < ApplicationController
  protect_from_forgery with: :exception
  respond_to :json

  def show
    @wall = AvailableWall.find(params[:id])
    render json: @wall.to_json
  end

  def index
    @walls = AvailableWall.limit(5).offset(params[:offset])
    render json: @walls.to_json
  end
end
