class RatingsController < ApplicationController
  def create
    @rating = Rating.find_or_create_by(route_id: params[:route_id], user_id: current_user.id) do |rating|
      rating.user_id = current_user.id
    end
    @rating.update(rating_params)

    if @rating.save
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 406
    end
  end

  private

  def rating_params
    params.permit(:route_id, :rating)
  end
end
