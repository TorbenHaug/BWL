class Menu < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  belongs_to :menu
  
  has_many :tags
  has_many :menus
end
