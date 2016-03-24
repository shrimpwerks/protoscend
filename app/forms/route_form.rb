class RouteForm < Reform::Form
  # include DSL
  # include Reform::Form::ActiveModel

  property :name
  property :user_id
  property :label
  property :location
  property :tape_color
  property :route_set_date
  property :expiration_date
  property :image_1
  property :image_2
  property :status
  property :grade

  validates_uniqueness_of :label, message: "ID is already taken by another route."
  
end
