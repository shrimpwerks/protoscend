class Route < ActiveRecord::Base

  # associations
  belongs_to :user, inverse_of: :routes

  has_many :comments, inverse_of: :route
  has_many :maintenance_requests, inverse_of: :route
  has_many :ratings, inverse_of: :route
  
end
