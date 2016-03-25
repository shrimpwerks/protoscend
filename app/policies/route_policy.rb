class RoutePolicy < ApplicationPolicy
  attr_reader :route, :record

  def initialize(current_user, route)
    @current_user = current_user
    @route = route
  end

  # only needed for assigned routes
  def index?
    @current_user.role != "Public"
  end

  def new?
    @current_user.role != "Public"
  end

  def create?
    @current_user.role != "Public"
  end

  def edit?
    # Supervisors and up, or the owner of the route
    (@current_user.role != "Public" and @current_user.role != "Setter" and
     @current_user.role != "Employee") or
     @current_user.id == @route.user_id
  end

  def update?
    # Supervisors and up, or the owner of the route
    (@current_user.role != "Public" and @current_user.role != "Setter" and
     @current_user.role != "Employee") or
     @current_user.id == @route.user_id
  end

  def destroy?
    (@current_user.role != "Public" and @current_user.role != "Setter" and
     @current_user.role != "Employee") or
     @current_user.id == @route.user_id
  end
end
