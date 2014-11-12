require 'paperclip/media_type_spoof_detector'
module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end

class Article < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :price
  validates_numericality_of :price, greater_than_or_equal_to: 0
  
  has_many :shopping_cart_entries
  has_many :users, :through => :shopping_cart_entries
  has_many :article_to_tags
  has_many :tags, :through => :article_to_tags
  
  has_many :article_structure_to, :foreign_key => 'upper_part_id', :class_name => 'ArticleStructure'
  has_many :article_structure_from, :foreign_key => 'lower_part_id', :class_name => 'ArticleStructure'
  
  has_attached_file :photo, :styles => { :small => "150x150>" },
                  :url  => "/assets/articles/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/articles/:id/:style/:basename.:extension"

  #validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
