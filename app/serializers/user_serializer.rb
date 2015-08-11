class UserSerializer < ActiveModel::Serializer
  attributes(
     :id, :fname, :lname, :email, :user_level, :small_groups_id, :hidden,
     :created_at, :route_count, :auth_token
  )

  has_many :routes
  #
  # def route_count
  #   object.routes.length
  # end
  #
  # def attributes
  #   hash = super
  #   if scope.admin?
  #     hash["ssn"] = object.ssn
  #     hash["secret"] = object.mothers_maiden_name
  #   end
  #   hash
  # end

end
