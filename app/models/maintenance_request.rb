class MaintenanceRequest < ActiveRecord::Base

  # associations
  belongs_to :route, inverse_of: :maintenance_requests
  belongs_to :user, inverse_of: :maintenance_requests

  enum grade: {
    :"Missing Tape"   => 0,
    :"Spinning Hold"   => 1,
    :"Missing Label"   => 2,
    :"Other"   => 3
  }

  ## @FIXME: For some reason, the priority radio doesn't auto-check based on the
  ## default value if the enum is in place, not sure how to fix. 
  # enum priority: {
  #   :"Low" => 0,
  #   :"Normal" => 1,
  #   :"High" => 2
  # }

end
