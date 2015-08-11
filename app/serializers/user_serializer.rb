class UserSerializer < ActiveModel::Serializer
  attributes(
     :id, :fname, :lname, :email, :user_level, :small_groups_id, :hidden,
     :created_at, :route_count
  )
  # 
  # def route_count
  #   object.routes.length
  # end

end
