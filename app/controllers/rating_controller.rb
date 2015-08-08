class RatingController < ApplicationController
  protect_from_forgery with: :exception
  respond_to :json

  # needs to return the rating a specific (logged-in) user has made, so it can
  # show that they already submitted a rating and display what it was.
  def show
    @rating = Rating.where(users_id: params[:users_id])
    render json: @rating.to_json
  end

  # This endpoint needs to return all the ratings to be averaged on the client
  # side, or have it do the work here and then render the rating. We'll come
  # back to this.
  def index
    @ratings = Rating.where(routes_id: params[:routes_id])
    render json: @ratings.to_json
  end
end
