module Admin
  class AssignedRoutesController < ApplicationController
    before_action :set_route, only: [:edit, :update, :destroy]

    def index
      @assigned_route = Route.new
      @assigned_routes = Route.assigned_routes
      @setters = User.setters
    end

    def create
      authorize Route.new
      @form = AssignedRouteForm.new

      if @form.submit(assigned_route_params)
        Mailer.assigned_route_mail(User.find(@form.user_id), @form.route).deliver_now

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
      authorize @route
      @form = RouteForm.new(@route)
    end

    def update
      authorize @route
      @form = RouteForm.new(@route)

      if @form.submit(route_params)
        flash[:success] = "Successfully completed assigned route."
        redirect_to [:admin, @route]
      else
        render :edit
      end
    end

    def destroy
      authorize @route
      @route.status = "inactive"

      if @route.save
        flash[:success] = "Successfully disabled route."
        redirect_to controller: "admin/assigned_routes", action: "index"
      else
        flash[:danger] = "Could not disable route."
        render :show
      end
    end

    private

    def assigned_route_params
      params.require(:route).permit(:user_id, :location, :grade)
    end

    def route_params
      route_attributes = %i(name user_id label location tape_color route_set_date
                            status grade description image_1 image_2)
      params.require(:route).permit(*route_attributes)
    end

    def set_route
      @route = Route.find(params[:id])
    end

  end
end
