class Article < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :price
  validates_numericality_of :price, greater_than_or_equal_to: 0
  
  has_many :tags
  has_many :shopping_cart_entries
  
  has_many :article_structure_to, :foreign_key => 'upper_part_id', :class_name => 'ArticleStructure'
  has_many :article_structure_from, :foreign_key => 'lower_part_id', :class_name => 'ArticleStructure'
end
