class Comment < ActiveRecord::Base

  # associations
  belongs_to :route, inverse_of: :comments
  belongs_to :user, inverse_of: :comments
end
