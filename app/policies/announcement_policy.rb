class AnnouncementPolicy < ApplicationPolicy

  def index?
    @user.role != "Public"
  end

  def new?
    @user.role != "Public" and
    @user.role != "Setter" and
    @user.role != "Employee"
  end

  def create?
    @user.role != "Public" and
    @user.role != "Setter" and
    @user.role != "Employee"
  end

  def show?
    @user.role != "Public" and
    @user.role != "Setter" and
    @user.role != "Employee"
  end

  def update?
    @user.role != "Public" and
    @user.role != "Setter" and
    @user.role != "Employee"
  end

  def edit?
    @user.role != "Public" and
    @user.role != "Setter" and
    @user.role != "Employee"
  end

  def destroy?
    @user.role != "Public" and
    @user.role != "Setter" and
    @user.role != "Employee"
  end
end
