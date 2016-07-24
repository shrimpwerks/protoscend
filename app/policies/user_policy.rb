class UserPolicy < ApplicationPolicy
  def index?
    @user.role != "Public"
  end

  def edit?
    @user.role == "Manager" || @user.role == "Administrator"
  end

  def update?
    @user.role == "Manager" || @user.role == "Administrator"
  end
end
