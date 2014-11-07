class ArticleToTag < ActiveRecord::Base
  validates_presence_of :article_id
  validates_presence_of :tag_id
  
  belongs_to :article
  belongs_to :tag
end
