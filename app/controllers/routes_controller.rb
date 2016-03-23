class RoutesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_route, only: [:edit, :update]
  before_action :new_route, only: [:new]

  def index
    @routes = Route.joins(:user).where(nil)
    @routes = @routes.with_full_text_search(params[:search]) if params[:search].present?
    @routes = @routes.order(sort_column + " " + sort_direction)
    @routes = @routes.active_routes
  end

  def show
    @route = Route.includes(comments: :user).find(params[:id])
    @request = MaintenanceRequest.new
    @comment = Comment.new
    @comments = @route.comments.most_recent
  end

  def new
    authorize @route
    @route.route_set_date = Date.today
    @setters = User.setters
  end

  def edit
    @setters = User.setters
  end

  def create
    @route = Route.new(route_params)
    ## @HACK: need for render new to work.
    @setters = User.setters
    authorize(@route)

    # FIXME This can fail if :route_set_date is invalid
    @route.expiration_date =
      Date.strptime(params[:route][:route_set_date], "%Y-%m-%d") + 3.months

    if @route.save
      flash[:success] = "Successfully created route listing."
      redirect_to action: "index"
    else
      flash[:danger] = "Could not create route listing."
      # redirect_to request.referer
      render :new
    end
  end

  def update
    authorize @route
    if @route.update(route_params)
      flash[:success] = "Successfully modified and saved route."
      redirect_to @route
    else
      flash[:danger] = "Could not modify route information."
      redirect_to action "edit"
    end
  end

  private

  def new_route
    @route = Route.new
  end

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, :user_id, :label, :location, :tape_color,
                                  :grade, :route_set_date, :image_1, :image_2)
  end

  def sort_column
    whitelist = %w(name users.first_name location tape_color grade route_set_date expiration_date)
    whitelist.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
