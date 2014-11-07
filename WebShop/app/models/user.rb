class User < ActiveRecord::Base
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :role
  validates_numericality_of :role, greater_than_or_equal_to: 0
end
