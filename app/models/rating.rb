class Rating < ActiveRecord::Base

  belongs_to :route, inverse_of: :ratings
  belongs_to :user, inverse_of: :ratings

  enum ratings: {
    :"1"   => 1,
    :"2"   => 2,
    :"3"   => 3,
    :"4"   => 4,
    :"5"   => 5
  }

  def self.get_user_rating(route_id, user_id)
    find_by(route_id: route_id, user_id: user_id)
  end

  def self.get_rating(route_id)
    rating = 0
    ratings = Rating.where(route_id: route_id).all
    if ratings.size > 0
      ratings.each do |r|
        rating = rating + r.rating
      end
      rating = (rating / ratings.size).round
    end
    rating
  end

end
