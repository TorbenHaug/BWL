class CreateArticleStructures < ActiveRecord::Migration
  def change
    create_table :article_structures do |t|
      t.integer :amount
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
