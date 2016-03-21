class CommentsController < ApplicationController

  def index
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.route_id = params[:route_id]
    if @comment.save
      redirect_to request.referer
    else
      flash[:danger] = "Couldn't save your comment"
      redirect_to request.referer
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :route_id, :user_id)
  end
end
