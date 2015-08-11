class User < ActiveRecord::Base
  # associations
  belongs_to :small_group, inverse_of: :users

  has_many :assigned_routes, inverse_of: :user
  has_many :comments, inverse_of: :user
  has_many :maintenance_requests, inverse_of: :user
  has_many :ratings, inverse_of: :user
  has_many :routes, inverse_of: :user
  has_many :support_tickets, inverse_of: :user

  def self.list_users(params)
    joins('left outer join routes on routes.user_id = users.id')
    .group(:id)
    .select('users.*, count(routes.id) as route_count')
    .limit(5)
    .offset(params[:offset])
    .order(params[:sort_by].to_s + ' ' + params[:order_by].to_s)
  end
end
