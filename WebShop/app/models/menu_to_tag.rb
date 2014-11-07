class MenuToTag < ActiveRecord::Base
  validates_presence_of :menu_id
  validates_presence_of :tag_id
  
  belongs_to :menu
  belongs_to :tag
end
