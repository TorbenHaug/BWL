class CreateArticleStructures < ActiveRecord::Migration
  def change
    create_table :article_structures, :id => false do |t|
      t.integer :amount
      t.datetime :deleted_at
      
      t.integer :upper_part_id
      t.integer :lower_part_id

      t.timestamps
    end
  end
end
