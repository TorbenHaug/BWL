class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :role
  validates_numericality_of :role
  validates_inclusion_of :role, in: 0..200

  has_secure_password
  validates :password, length: { minimum: 6 }

  has_many :shopping_cart_entries
  has_many :bill
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
