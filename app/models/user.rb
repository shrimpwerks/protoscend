class User < ActiveRecord::Base
  validates :fname, presence: true
  validates :lname, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :small_group
  # has_many :assigned_routes
  has_many :comments
  has_many :maintenance_requests
  has_many :ratings
  has_many :routes
  has_many :support_tickets

  def name
    "#{fname} #{lname}"
  end

  # TODO Replace with ActiveRecord #or with Rails 5
  def self.with_full_text_search(term)
    q = 'fname LIKE ? OR lname LIKE ? OR email LIKE ?'
    where([q, "%#{term}%", "%#{term}%", "%#{term}%"])
  end
end
