class User < ActiveRecord::Base

  # associations
  belongs_to :small_group, inverse_of: :users

  has_many :assigned_routes, inverse_of: :user
  has_many :comments, inverse_of: :user
  has_many :maintenance_requests, inverse_of: :user
  has_many :ratings, inverse_of: :user
  has_many :routes, inverse_of: :user
  has_many :support_tickets, inverse_of: :user
end
