class RoutePolicy < ApplicationPolicy
  attr_reader :route, :record

  def initialize(current_user, route)
    @current_user = current_user
    @route = route
  end

  def new?
    @current_user.user_level > 0
  end

  def create?
    @current_user.user_level > 0
  end

  def edit?
    @current_user.id == @route.user_id
  end

  def update?
    @current_user.id == @route.user_id
  end
end
