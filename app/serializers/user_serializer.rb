class UserSerializer < ActiveModel::Serializer
  attributes :id
  attributes :fname
  attributes :lname
  attributes :email
  attributes :user_level
  attributes :small_groups_id
  attributes :hidden
  attributes :routes_count

  # has_many :routes
end
