class AssignedRoutesController < ApplicationController

  def index
    @assigned_route = Route.new
    @assigned_routes = Route.assigned_routes
    @setters = User.setters
  end

  def create
    authorize Route.new
    @form = AssignedRouteForm.new(Route.new)

    if @form.validate(params[:route])
      @form.status = 1
      @form.save
      flash[:success] = "Successfully assigned route."
      redirect_to action: :index
    else
      flash[:danger] = "Could not assign route."
      redirect_to request.referer
    end
  end

  def show
  end

  def edit
    @route = Route.find(params[:id])
    authorize @route
    @form = RouteForm.new(@route)
  end

  def update
    @route = Route.find(params[:id])
    authorize @route
    @form = RouteForm.new(@route)

    if @form.validate(params[:route])
      @form.status = 0
      @form.expiration_date = @form.route_set_date.to_date + 3.months
      @form.save
      flash[:success] = "Successfully completed assigned route."
      redirect_to @route
    else
      render :edit
    end
  end

  def destroy
    @route = Route.find(params[:id])
    authorize @route
    @route.status = "inactive"

    if @route.save
      flash[:success] = "Successfully disabled route."
      redirect_to action: "index"
    else
      flash[:danger] = "Could not disable route."
      render :show
    end
  end

end
