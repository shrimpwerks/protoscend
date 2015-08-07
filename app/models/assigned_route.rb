class AssignedRoute < ActiveRecord::Base

  # associations
  belongs_to :user, inverse_of: :assigned_routes
end
