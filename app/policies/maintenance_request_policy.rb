class MaintenanceRequestPolicy < ApplicationPolicy
  attr_reader :request, :record

  def initialize(current_user, request)
    @current_user = current_user
    @request = request
  end

  def index?
    @current_user.role != "Public"
  end

  def show?
    @current_user.role != "Public"
  end

  def new?
    @current_user.role != "Public"
  end

  def create?
    @current_user.role != "Public"
  end

  def edit?
    # Supervisors and up, or the owner of the request
    (@current_user.role != "Public" and @current_user.role != "Setter" and
     @current_user.role != "Employee") or
     @current_user.id == @request.user_id
  end

  def update?
    # Supervisors and up, or the owner of the request
    (@current_user.role != "Public" and @current_user.role != "Setter" and
     @current_user.role != "Employee") or
     @current_user.id == @request.user_id
  end

  def resolve?
    @current_user.role != "Public"
  end

  def destroy?
    # Supervisors and up, or the owner of the request
    (@current_user.role != "Public" and @current_user.role != "Setter" and
     @current_user.role != "Employee") or
     @current_user.id == @request.user_id
  end
end
