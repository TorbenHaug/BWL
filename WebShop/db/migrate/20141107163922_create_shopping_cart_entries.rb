class CreateShoppingCartEntries < ActiveRecord::Migration
  def change
    create_table :shopping_cart_entries, :id => false do |t|
      t.integer :amount
      
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
    
    execute "ALTER TABLE shopping_cart_entries ADD PRIMARY KEY (user_id, article_id);"
  end
end
