class Route < ActiveRecord::Base

  before_create do
    self.expiration_date = self.route_set_date + 3.months
  end

  belongs_to :user, counter_cache: true
  has_many :comments
  has_many :maintenance_requests
  has_many :ratings

  enum status: {active: 0, assigned: 1, inactive: 2}
  enum grade: {
    :"5.6"   => 0,
    :"5.7"   => 1,
    :"5.8"   => 2,
    :"5.9"   => 3,
    :"5.10-" => 4,
    :"5.10"  => 5,
    :"5.10+" => 6,
    :"5.11-" => 7,
    :"5.11"  => 8,
    :"5.11+" => 9,
    :"5.12-" => 10,
    :"5.12"  => 11,
    :"5.12+" => 12,
    :"5.13"  => 13
  }
  enum location: {
    "McAlexander" => "McAlexander",
    "Dixon"       => "Dixon"
  }

  # TODO Replace with ActiveRecord #or with Rails 5
  def self.with_full_text_search(term)
    q = 'name LIKE ? OR users.first_name LIKE ? OR users.last_name LIKE ? OR tape_color LIKE ?'
    joins(:user).where([q, "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%"])
  end

  def self.location(loc)
    where(location: loc)
  end

  def self.assigned_routes
    where(status: 1)
  end

  def self.active_routes
    where(status: 0)
  end

  def self.expired_routes
    where('expiration_date < ?', Date.today.to_s)
  end

end
