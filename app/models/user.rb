class User < ActiveRecord::Base

  # associations
  belongs_to :small_group, inverse_of: :users

  # alias_method "fuck_name", "fname"

  has_many :assigned_routes, inverse_of: :user
  has_many :comments, inverse_of: :user
  has_many :maintenance_requests, inverse_of: :user
  has_many :ratings, inverse_of: :user
  has_many :routes, inverse_of: :user
  has_many :support_tickets, inverse_of: :user

  def self.list_users(params)
    joins('left outer join routes on routes.user_id = users.id').group(:id)
    .select('users.*, count(routes.id) as route_count')
    .limit(5)
  end

  def self.search_fname(fname)
    where("users.fname LIKE :fname", {:fname => "%#{fname}%"})
  end

  def self.search_lname(lname)
    where("users.lname LIKE :lname", {:lname => "%#{lname}%"})
  end

  def self.search_email(email)
    where("users.email LIKE :email", {:email => "%#{email}%"})
  end

  def self.offset_by(params)
    offset(params[:offset])
  end

  def self.order_by(params)
    order(params[:sort_by].to_s + ' ' + params[:order_by].to_s)
  end
end
