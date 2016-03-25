class AssignedRoutePolicy < ApplicationPolicy
  attr_reader :assigned_route, :record

  def initialize(current_user, assigned_route)
    @current_user = current_user
    @assigned_route = assigned_route
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
end
