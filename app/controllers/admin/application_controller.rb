module Admin
  class ApplicationController < ::ApplicationController
    layout "admin"

    before_filter :check_role

    private

    def check_role
      if current_user.role == "Public"
        flash[:danger] = "The admin interface is for setters and staff's access. If this is a mistake please contact the gym manager."
        redirect_to controller: "/home", action: "index"
      end
    end
  end
end
