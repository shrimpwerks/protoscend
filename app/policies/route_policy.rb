class RoutePolicy < ApplicationPolicy

  # only needed for assigned routes
  def index?
    @user.role != "Public"
  end

  def new?
    @user.role != "Public"
  end

  def create?
    @user.role != "Public"
  end

  def edit?
    # Supervisors and up, or the owner of the route
    (@user.role != "Public" and @user.role != "Setter" and
     @user.role != "Employee") or
     @user.id == @record.user_id
  end

  def update?
    # Supervisors and up, or the owner of the route
    (@user.role != "Public" and @user.role != "Setter" and
     @user.role != "Employee") or
     @user.id == @record.user_id
  end

  def destroy?
    (@user.role != "Public" and @user.role != "Setter" and
     @user.role != "Employee") or
     @user.id == @record.user_id
  end
end
