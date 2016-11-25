module Admin
  class ChartsController < ApplicationController
    def routes
      data = [
        { name: "Active", data: active_routes },
        { name: "Expired", data: expired_routes },
        { name: "Assigned", data: assigned_routes }
      ]
      render json: data
    end

    private

    def active_routes
      data = []
      Route.grades.each { |gkey, gvalue| data.push([gkey, 0]) }

      Route.live_routes.location(params[:location]).group(:grade).order(:grade).count.each { |key, value|
        data.each_with_index { |v, i| data[i][1] = value if v[0] == Route.grades.key(key) }
      }
      data
    end

    def expired_routes
      data = []
      Route.grades.each { |gkey, gvalue| data.push([gkey, 0]) }

      Route.expired_routes.location(params[:location]).group(:grade).order(:grade).count.each { |key, value|
        data.each_with_index { |v, i| data[i][1] = value if v[0] == Route.grades.key(key) }
      }
      data
    end

    def assigned_routes
      data = []
      Route.grades.each { |gkey, gvalue| data.push([gkey, 0]) }

      Route.assigned_routes.location(params[:location]).group(:grade).order(:grade).count.each { |key, value|
        data.each_with_index { |v, i| data[i][1] = value if v[0] == Route.grades.key(key) }
      }
      data
    end
  end
end
