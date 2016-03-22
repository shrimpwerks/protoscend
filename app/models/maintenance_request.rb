class MaintenanceRequest < ActiveRecord::Base

  # associations
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

end
