class Bill < ActiveRecord::Base
  validates_presence_of :user_id
  has_many :bill_entries
  belongs_to :user
end
