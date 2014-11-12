class Menu < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  belongs_to :super_menu, :class_name => 'Menu'
  
  has_many :menus, foreign_key: 'super_menu_id'
  has_many :menu_to_tags
  has_many :tags, :through => :menu_to_tags
  def all_tags
    if self.menus.empty?; return tags.to_set end
    menus.inject(tags.to_set) { |accu, obj | accu + obj.all_tags}
  end
end
