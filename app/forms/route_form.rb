class RouteForm < Reform::Form
  include Reform::Form::ActiveModel

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

  validates :name, presence: true
  validates :user_id, presence: true
  validates :label, presence: true
  validates :location, presence: true
  validates :tape_color, presence: true
  validates :route_set_date, presence: true
  validates :expiration_date, presence: true
  validates :image_1, presence: true
  validates :image_2, presence: true
  validates :status, presence: true
  validates :grade, presence: true

  validates_uniqueness_of :label, message: "ID is already taken by another route."

end
