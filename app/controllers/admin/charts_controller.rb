module Admin
  class ChartsController < ApplicationController

    def routes
      render json: [
        { name: "Active", data: active_routes },
        { name: "Expired", data: expired_routes },
        { name: "Assigned", data: assigned_routes }
      ]
    end

    private

    def active_routes
      Route.active_routes.location(params[:location]).group(:grade).count
        .map { |key, value| [Route.grades.select { |gkey, gvalue| gvalue == key }.keys.first, value] }
    end

    def expired_routes
      Route.expired_routes.location(params[:location]).group(:grade).count
        .map { |key, value| [Route.grades.select { |gkey, gvalue| gvalue == key }.keys.first, value] }
    end

    def assigned_routes
      Route.assigned_routes.location(params[:location]).group(:grade).count
        .map { |key, value| [Route.grades.select { |gkey, gvalue| gvalue == key }.keys.first, value] }
    end

  end
end
