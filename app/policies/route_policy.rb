class RoutePolicy < ApplicationPolicy
  attr_reader :route, :record

  def initialize(current_user, route)
    @current_user = current_user
    @route = route
  end

  # only needed for assigned routes
  def index?
    puts 'got here'
    @current_user.role != "Public"
  end

  def new?
    @current_user.role != "Public"
  end

  def create?
    @current_user.role != "Public"
  end

  def edit?
    @current_user.id == @route.user_id
  end

  def update?
    @current_user.id == @route.user_id
  end
end
