class CommentPolicy < ApplicationPolicy

  def create?
    @user.role != "Public" and
    @user.id === @record.user_id
  end
end
