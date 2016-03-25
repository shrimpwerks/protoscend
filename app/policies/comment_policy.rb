class CommentPolicy < ApplicationPolicy
  attr_reader :comment, :record

  def initialize(current_user, comment)
    @current_user = current_user
    @comment = comment
  end

  def create?
    @current_user.role != "Public" and
    @current_user.id === @comment.user_id
  end
end
