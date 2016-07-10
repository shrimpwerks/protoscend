class AssignedRoutePolicy < ApplicationPolicy

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
end
