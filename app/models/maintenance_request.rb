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

  private

  def self.not_resolved
    where(resolved: 0)
  end

end
