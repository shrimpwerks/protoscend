class MaintenanceRequest < ActiveRecord::Base
  validates_presence_of :route_id
  validates_presence_of :issue
  validates_presence_of :priority
  validates_presence_of :reason

  belongs_to :route, inverse_of: :maintenance_requests
  belongs_to :user, inverse_of: :maintenance_requests

  enum issue: {
    :"Missing Tape"   => 0,
    :"Spinning Hold"   => 1,
    :"Missing Label"   => 2,
    :"Other"   => 3
  }

  enum priority: {
    :"Low" => 0,
    :"Normal" => 1,
    :"High" => 2
  }

  enum status: {unresolved: 0, resolved: 1, canceled: 2}

  private

  def self.not_resolved
    where(status: "unresolved")
  end

  # TODO Replace with ActiveRecord #or with Rails 5
  def self.with_full_text_search(term)
    q = 'routes.name ILIKE ? OR users.first_name ILIKE ? OR users.last_name ILIKE ? OR reason ILIKE ?'
    joins(:user).where([q, "%#{term}%", "%#{term}%", "%#{term}%", "%#{term}%"])
  end

end
