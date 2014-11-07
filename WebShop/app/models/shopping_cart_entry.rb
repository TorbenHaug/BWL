class ShoppingCartEntry < ActiveRecord::Base
  validates_presence_of :amount
  validates_numericality_of :amount, greater_than: 0
  
  belongs_to :user
  belongs_to :article
end
