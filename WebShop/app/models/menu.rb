class Menu < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :super_menu_id
  
  belongs_to :menu, :class_name => 'Menu', :foreign_key => 'super_menu_id'
  
  has_many :menus
  has_many :menu_to_tags
end
