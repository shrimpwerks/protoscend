class AnnouncementPolicy < ApplicationPolicy
  attr_reader :announcement, :record

  def initialize(current_user, announcement)
    @current_user = current_user
    @announcement = announcement
  end

  def index?
    @current_user.role != "Public"
  end

  def new?
    @current_user.role != "Public" and
    @current_user.role != "Setter" and
    @current_user.role != "Employee"
  end

  def create?
    @current_user.role != "Public" and
    @current_user.role != "Setter" and
    @current_user.role != "Employee"
  end

  def show?
    @current_user.role != "Public" and
    @current_user.role != "Setter" and
    @current_user.role != "Employee"
  end

  def update?
    @current_user.role != "Public" and
    @current_user.role != "Setter" and
    @current_user.role != "Employee"
  end

  def edit?
    @current_user.role != "Public" and
    @current_user.role != "Setter" and
    @current_user.role != "Employee"
  end

  def destroy?
    @current_user.role != "Public" and
    @current_user.role != "Setter" and
    @current_user.role != "Employee"
  end
end
