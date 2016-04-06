class RouteForm
  include ActiveModel::Model

  attr_accessor :route

  delegate :id, :name, :user_id, :label, :location, :tape_color, :route_set_date, \
    :expiration_date, :status, :grade, :description, :image_1, :image_2, to: :route

  validates :name, presence: true
  validates :user_id, presence: true
  validates :label, presence: true, unique_label: true
  validates :location, presence: true
  validates :tape_color, presence: true
  validates :route_set_date, presence: true
  validates :status, presence: true
  validates :grade, presence: true
  validates :description, presence: true

  def self.model_name
    ActiveModel::Name.new(self, nil, "Route")
  end

  def initialize(route = nil)
    self.route = route || Route.new(route_set_date: Date.today)
  end

  def persisted?
    self.route.persisted?
  end

  def submit(params)
    self.route.attributes = params
    if valid?
      if self.route.new_record? || self.route.status == 'assigned'
        self.route.expiration_date = self.route.route_set_date.to_date + 3.months
        self.route.status = 'active'
      end
      self.route.save
      true
    else
      false
    end
  end

end
