class AssignedRoutePolicy < ApplicationPolicy
  attr_reader :assigned_route, :record

  def initialize(current_user, assigned_route)
    @current_user = current_user
    @assigned_route = assigned_route
  end

  def create?
    @current_user.role > 2
  end

  def edit?
  end

  def update?
  end
end
