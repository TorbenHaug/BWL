class BillEntry < ActiveRecord::Base
  self.primary_keys = :bill_id, :article_id
  
  validates_presence_of :bill_id
  validates_presence_of :article_id
  validates_presence_of :amount
  
  belongs_to :bill
  belongs_to :article
end
