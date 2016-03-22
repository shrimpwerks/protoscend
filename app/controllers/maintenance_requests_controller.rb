class MaintenanceRequestsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @requests = MaintenanceRequest.joins(:user).joins(:route).where(nil)
    @requests = @requests.order(sort_column + " " + sort_direction)
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

  def sort_column
    whitelist = %w(routes.name users.first_name issue reason priority created_at)
    whitelist.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
