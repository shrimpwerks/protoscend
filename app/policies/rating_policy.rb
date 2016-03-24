class RatingPolicy < ApplicationPolicy
  attr_reader :rating, :record

  def initialize(current_user, rating)
    @current_user = current_user
    @rating = rating
  end
end
