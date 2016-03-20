class CommentsController < ApplicationController

  def index
  end

  def create
    @comment = Comment.new
    ## @HACK: this feels like a hack, so I will come back to this.
    params[:comment][:route_id] = params[:route_id]
    params[:comment][:user_id] = current_user.id
    if @comment = Comment.create(comment_params)
      redirect_to request.referer
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :route_id, :user_id)
  end
end
