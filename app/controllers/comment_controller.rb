class CommentController < ApplicationController
  protect_from_forgery with: :exception
  respond_to :json

  def show
    @comment = Comment.find(params[:id])
    render json: @comment.to_json
  end

  def index
    @comments = Comment.limit(5).offset(params[:offset])
    render json: @comments.to_json
  end
end
