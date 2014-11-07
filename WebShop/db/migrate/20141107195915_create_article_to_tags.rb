class CreateArticleToTags < ActiveRecord::Migration
  def change
    create_table :article_to_tags do |t|
      t.integer :article_id
      t.integer :tag_id
      
      t.timestamps
    end
  end
end
