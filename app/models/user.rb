class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :assigned_routes
  has_many :comments
  has_many :maintenance_requests
  has_many :ratings
  has_many :routes
  has_many :support_tickets

  enum role: {
    :'Public'        => 0,
    :'Setter'        => 1,
    :'Employee'      => 2,
    :'Supervisor'    => 3,
    :'Manager'       => 4,
    :'Administrator' => 5
  }

  def name
    "#{first_name} #{last_name}"
  end

  def self.setters
    where('role <> 0').order(:first_name)
  end

  # TODO Replace with ActiveRecord #or with Rails 5
  def self.with_full_text_search(term)
    q = 'first_name LIKE ? OR last_name LIKE ? OR email LIKE ?'
    where([q, "%#{term}%", "%#{term}%", "%#{term}%"])
  end
end
