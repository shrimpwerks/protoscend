class Rating < ActiveRecord::Base

  # associations
  belongs_to :route, inverse_of: :ratings
  belongs_to :user, inverse_of: :ratings
end
