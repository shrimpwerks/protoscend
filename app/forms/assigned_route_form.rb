class AssignedRouteForm < Reform::Form
  # include DSL
  # include Reform::Form::ActiveModel

  property :user_id
  property :location
  property :grade
  property :status

  validates :user_id, presence: true
  validates :location, presence: true
  validates :grade, presence: true

end
