class AssignedRoute < ActiveRecord::Base

  # associations
  belongs_to :user, inverse_of: :assigned_routes

  def self.with_users
    joins(:user)
  end

  def self.for_user(id)
    where :user_id => id
  end

  def self.not_complete
    where :completed => false
  end

  def self.not_hidden
    where :hidden => false
  end



end
