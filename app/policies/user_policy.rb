class UserPolicy < ApplicationPolicy
  def index?
    @user.role != "Public"
  end
  
  def edit?
    @user.id === @record.id
  end

  def update?
    @user.id === @record.id
  end
end
