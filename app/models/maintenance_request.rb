class MaintenanceRequest < ActiveRecord::Base

  # associations
  belongs_to :route, inverse_of: :maintenance_requests
  belongs_to :user, inverse_of: :maintenance_requests
end
