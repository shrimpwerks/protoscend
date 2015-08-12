class Api::MaintenanceRequestController < ApplicationController
  protect_from_forgery with: :exception
  respond_to :json

  def show
    @request = MaintenanceRequest.find(params[:id])
    render json: @request.to_json
  end

  def index
    @requests = MaintenanceRequest.limit(5).offset(params[:offset])
    render json: @requests.to_json
  end
end
