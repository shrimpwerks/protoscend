class Route < ActiveRecord::Base

  has_attached_file :image_1, source_file_options: { all: '-auto-orient' }, styles: { original: "" }
  has_attached_file :image_2, source_file_options: { all: '-auto-orient' }, styles: { original: "" }
  validates_attachment :image_1, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :image_2, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

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
    q = 'name ILIKE ? OR users.first_name ILIKE ? OR users.last_name ILIKE ? OR tape_color ILIKE ? OR label = ?'
    joins(:user).where([q, "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%", term.to_i])
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
