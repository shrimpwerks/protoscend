class RouteForm < Reform::Form
  include Reform::Form::ActiveModel
  include Reform::Form::ActiveModel::FormBuilderMethods

  property :name
  property :user_id
  property :label
  property :location
  property :tape_color
  property :route_set_date
  property :expiration_date
  property :status
  property :grade

  validates :name, presence: true
  validates :user_id, presence: true
  validates :label, presence: true
  validates :location, presence: true
  validates :tape_color, presence: true
  validates :route_set_date, presence: true
  validates :status, presence: true
  validates :grade, presence: true
  validates_uniqueness_of :label

  # property :image_1
  # property :image_2
  # validates :image_1, presence: true
  # validates :image_2, presence: true

  def route_set_date
    super || Date.today
  end

end
