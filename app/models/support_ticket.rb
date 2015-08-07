class SupportTicket < ActiveRecord::Base

  # associations
  belongs_to :user, inverse_of: :support_tickets
end
