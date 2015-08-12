class Api::SmallGroupController < ApplicationController
  protect_from_forgery with: :exception
  respond_to :json

  def show
    @group = SmallGroup.find(params[:id])
    render json: @group.to_json
  end

  def index
    @groups = SmallGroup.limit(5).offset(params[:offset])
    render json: @groups.to_json
  end
end
