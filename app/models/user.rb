class User <ApplicationRecord 
  validates_presence_of :email, :name 
  validates_uniqueness_of :email
  has_many :viewing_parties

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  has_secure_password
  enum role: %w(default manager admin)

end 