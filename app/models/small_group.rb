class SmallGroup < ActiveRecord::Base

  #associations
  has_many :users, inverse_of: :small_group
end
