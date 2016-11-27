class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :assigned_routes
  has_many :comments
  has_many :maintenance_requests
  has_many :ratings
  has_many :routes

  enum role: {
    :'Public'        => 0,
    :'Setter'        => 1,
    :'Employee'      => 2,
    :'Supervisor'    => 3,
    :'Manager'       => 4,
    :'Administrator' => 5
  }

  def name
    "#{first_name} #{last_name}"
  end

  def self.setters
    active
    .where('role <> 0')
    .order(:first_name)
  end

  def self.top_setters
    select("users.*, avg(ratings.rating) as rating")
    .active
    .joins(:routes)
    .joins(routes: :ratings)
    .where(routes: { status: 0 })
    .where.not(users: { role: 0 })
    .group(:id)
    .order("rating desc")
    .take(10)
  end

  # TODO Replace with ActiveRecord #or with Rails 5
  def self.with_full_text_search(term)
    q = 'first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?'
    where([q, "%#{term}%", "%#{term}%", "%#{term}%"])
  end

  def self.active
    where(is_deleted: false)
  end
end
