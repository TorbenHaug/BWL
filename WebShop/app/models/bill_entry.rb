class BillEntry < ActiveRecord::Base
  belongs_to :bill
  belongs_to :article
end
