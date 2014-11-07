class ArticleStructure < ActiveRecord::Base
  validates_presence_of :amount
  validates_numericality_of :amount, greater_than: 0
  
  belongs_to :upper_part, :class_name => 'Article', :foreign_key => 'upper_part_id'
  belongs_to :lower_part, :class_name => 'Article', :foreign_key => 'lower_part_id'
end
