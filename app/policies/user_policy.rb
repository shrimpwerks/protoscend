class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def edit?
    @current_user.id === @user.id
  end

  def update?
    @current_user.id === @user.id
  end
end
