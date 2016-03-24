class MaintenanceRequestsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_routes, only: [:update, :new, :create, :edit]
  before_action :set_request, only: [:edit, :update, :resolve, :show]
  before_action :new_request, only: [:new, :create, :index]

  def index
    @requests = MaintenanceRequest.joins(:user, :route).all
    @requests = @requests.order(sort_column + " " + sort_direction)
    @requests = @requests.not_resolved
  end

  def show
  end

  def edit
  end

  def update
    if @request.update(request_params)
      flash[:success] = "Successfully modified and saved maintenance request."
      redirect_to @request
    else
      flash[:danger] = "Could not modify maintenance request."
      render :edit
    end
  end

  def new
    @request = MaintenanceRequest.new(new_request_params)
  end

  def create
    @request = MaintenanceRequest.new(request_params)
    @request.user_id = current_user.id
    if @request.save
      flash[:success] = "Successfully submitted maintenance request."
      redirect_to route_path(@request.route_id)
    else
      flash[:danger] = "Could not submit maintenance request."
      render :new
    end
  end

  def resolve
    @request.resolved = 1
    if @request.save
      flash[:success] = "Successfully resolved maintenance request."
      redirect_to action: "index"
    else
      flash[:danger] = "Could not resolve maintenance request."
      render :show
    end
  end

  private

  def new_request
    @request = MaintenanceRequest.new
    authorize @request
  end

  def set_request
    @request = MaintenanceRequest.find(params[:id])
    authorize @request
  end

  def set_routes
    @routes = Route.order("name ASC").active_routes
  end

  def new_request_params
    params.permit(:route_id)
  end

  def request_params
    params.require(:maintenance_request).permit(:issue, :priority, :reason, :route_id)
  end

  def sort_column
    whitelist = %w(routes.name users.first_name issue reason priority created_at)
    whitelist.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
