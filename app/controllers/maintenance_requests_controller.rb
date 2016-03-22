class MaintenanceRequestsController < ApplicationController
  protect_from_forgery with: :exception
  respond_to :json

  def index
    @requests = MaintenanceRequest.where(nil)
  end

  def new
    @routes = Route.order("name ASC").active_routes
    @request = MaintenanceRequest.new(new_request_params)
  end

  def create
    @request = MaintenanceRequest.new(create_request_params)
    @request.user_id = current_user.id
    if @request.save
      redirect_to controller: 'routes', action: 'show', id: params[:maintenance_request][:route_id]
    else
      render "new"
    end
  end

  private

  def new_request_params
    params.permit(:route_id)
  end

  def create_request_params
    params.require(:maintenance_request).permit(:type, :priority, :reason, :route_id)
  end
end
