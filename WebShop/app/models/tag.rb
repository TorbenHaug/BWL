class Tag < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :menu_to_tags
  has_many :menus, :through => :menu_to_tags
  has_many :article_to_tags
  has_many :articles, :through => :article_to_tags
end
