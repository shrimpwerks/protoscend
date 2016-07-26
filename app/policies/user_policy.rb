class UserPolicy < ApplicationPolicy
  def index?
    @user.role != "Public"
  end

  ## managers and admins can edit anyone, supervisors can edit anyone that's not
  ## an admin or a supervisor.
  def edit?
    @user.role == "Manager" || @user.role == "Administrator" ||
    (@user.role == "Supervisor" && (@record.role != "Manager" && @record.role != "Administrator"))
  end

  def update?
    @user.role == "Manager" || @user.role == "Administrator" ||
    (@user.role == "Supervisor" && (@record.role != "Manager" && @record.role != "Administrator"))
  end
end
