class ArticleStructure < ActiveRecord::Base
  self.primary_keys = :upper_part_id, :lower_part_id
  
  validates_presence_of :amount
  validates_numericality_of :amount, greater_than: 0
  validates_presence_of :upper_part_id
  validates_presence_of :lower_part_id
  
  belongs_to :upper_part, :class_name => 'Article', :foreign_key => 'upper_part_id'
  belongs_to :lower_part, :class_name => 'Article', :foreign_key => 'lower_part_id'
end
