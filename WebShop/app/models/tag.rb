class Tag < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :article_id
  validates_presence_of :menu_id
  
  belongs_to :article
  belongs_to :menu
end
