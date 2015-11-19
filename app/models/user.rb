class User < ActiveRecord::Base
  validates :fname, presence: true
  validates :lname, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :small_group, inverse_of: :users
  has_many :assigned_routes, inverse_of: :user
  has_many :comments, inverse_of: :user
  has_many :maintenance_requests, inverse_of: :user
  has_many :ratings, inverse_of: :user
  has_many :routes, inverse_of: :user
  has_many :support_tickets, inverse_of: :user

  def name
    "#{fname} #{lname}"
  end

  def self.get_setters
    where('user_level > 0').order(:fname)
  end

  def self.with_first_name(first_name)
    where("users.fname LIKE ?", "%#{first_name}%")
  end

  def self.with_last_name(last_name)
    where("users.lname LIKE ?", "%#{last_name}%")
  end

  def self.with_email(email)
    where("users.email LIKE ?", "%#{email}%")
  end
end
