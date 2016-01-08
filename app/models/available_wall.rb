class AvailableWall < ActiveRecord::Base

  def self.available
    where :available => true
  end
end
