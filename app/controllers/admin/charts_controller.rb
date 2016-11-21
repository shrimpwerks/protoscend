module Admin
  class ChartsController < ApplicationController

    def routes
      butts = [
        { name: "Active", data: active_routes },
        { name: "Expired", data: expired_routes },
        { name: "Assigned", data: assigned_routes }
      ]
      puts Route.live_routes.location(params[:location]).group(:grade).order(:grade).count
      puts butts
      render json: butts
    end

    private

    def active_routes
      Route.live_routes.location(params[:location]).group(:grade).order(:grade).count
        .map { |key, value| [Route.grades.each { |gkey, gvalue| gvalue == key }.keys[key], value] }
    end

    def expired_routes
      Route.active_routes.expired_routes.location(params[:location]).group(:grade).order(:grade).count
        .map { |key, value| [Route.grades.each { |gkey, gvalue| gvalue == key }.keys[key], value] }
    end

    def assigned_routes
      Route.assigned_routes.location(params[:location]).group(:grade).order(:grade).count
        .map { |key, value| [Route.grades.each { |gkey, gvalue| gvalue == key }.keys[key], value] }
    end

  end
end
