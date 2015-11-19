class Route < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user, counter_cache: true
  has_many :comments
  has_many :maintenance_requests
  has_many :ratings

  # TODO Replace with ActiveRecord #or with Rails 5
  def self.with_full_text_search(term)
    q = 'name LIKE ? OR users.fname LIKE ? OR users.lname LIKE ? OR tape_color LIKE ?'
    joins(:user).where([q, "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%"])
  end
end
