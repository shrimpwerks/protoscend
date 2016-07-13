module Admin
  class ExpiringRoutesController < ApplicationController
    helper_method :sort_column, :sort_direction

    def index
      @routes = Route.joins(:user).active_routes.expiring
      @routes = @routes.order(sort_column + " " + sort_direction)
      @routes = @routes.page(params[:page])
    end

    private

    def sort_column
      whitelist = %w(label name users.first_name location tape_color grade route_set_date expiration_date)
      whitelist.include?(params[:sort]) ? params[:sort] : "expiration_date"
    end

    def sort_direction
      %w(asc desc).include?(params[:direction]) ?  params[:direction] : "asc"
    end
  end
end
