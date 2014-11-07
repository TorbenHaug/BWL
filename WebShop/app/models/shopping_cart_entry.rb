class ShoppingCartEntry < ActiveRecord::Base
  self.primary_keys = :user_id, :article_id
  
  validates_presence_of :amount
  validates_numericality_of :amount, greater_than: 0
  validates_presence_of :user_id
  validates_presence_of :article_id
  
  belongs_to :user
  belongs_to :article
end
