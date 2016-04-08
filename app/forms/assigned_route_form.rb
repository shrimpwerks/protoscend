class AssignedRouteForm
  include ActiveModel::Model

  attr_accessor :route

  delegate :user_id, :location, :grade, to: :route

  validates :user_id, presence: true
  validates :location, presence: true
  validates :grade, presence: true

  def self.model_name
    ActiveModel::Name.new(self, nil, "Route")
  end

  def initialize(route = nil)
    self.route = route || Route.new
  end

  def persisted?
    self.route.persisted?
  end

  def submit(params)
    self.route.attributes = params
    if valid?
      self.route.status = 1
      self.route.save
      true
    else
      false
    end
  end

end
