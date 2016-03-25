class RoutesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_route, only: [:edit, :update]
  before_action :new_route, only: [:new, :create]
  before_action :set_setters, only: [:new, :edit, :create, :update]

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

    @user_rating = Rating.get_user_rating(@route.id, current_user.id)
    @rating = Rating.get_rating(@route.id)
  end

  def new
    @route.route_set_date = Date.today
  end

  def edit
  end

  def create
    @route = RouteForm.new(Route.new(route_params))

    # FIXME This can fail if :route_set_date is invalid
    @route.expiration_date =
      Date.strptime(params[:route][:route_set_date], "%Y-%m-%d") + 3.months

    if @route.validate(params[:route])
      @route.save
      flash[:success] = "Successfully created route listing."
      redirect_to action: "index"
    else
      flash[:danger] = "Could not create route listing."
      render :new
    end
  end

  def update
    @route.update(route_params)
    @route = RouteForm.new(@route)

    if @route.validate(params[:route])
      @route.save
      flash[:success] = "Successfully modified and saved route."
      redirect_to @route
    else
      flash[:danger] = "Could not modify route information."
      render :edit
    end
  end

  private

  def set_setters
    @setters = User.setters
  end

  def new_route
    @route = Route.new
    authorize @route
  end

  def set_route
    @route = Route.find(params[:id])
    authorize @route
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
