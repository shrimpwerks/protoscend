class Announcement < ActiveRecord::Base
  belongs_to :user, counter_cache: true

  enum status: {
    active: 0,
    inactive: 1
  }

  def self.active_announcements
    where(status: 0)
  end

  def self.not_expired
    where('expires_at >= ?', Date.today.to_s)
  end

  def self.revealed
    where('reveal_date <= ?', Date.today.to_s)
  end

  def self.with_users
    joins(:user)
  end

  # TODO Replace with ActiveRecord #or with Rails 5
  def self.with_full_text_search(term)
    q = 'subject ILIKE ? OR users.first_name ILIKE ? OR users.last_name ILIKE ? OR body ILIKE ?'
    joins(:user).where([q, "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%"])
  end

end
