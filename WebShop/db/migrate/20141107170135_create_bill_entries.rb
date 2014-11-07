class CreateBillEntries < ActiveRecord::Migration
  def change
    create_table :bill_entries, :id => false do |t|
      t.integer :amount
      
      t.integer :bill_id
      t.integer :article_id

      t.timestamps
    end
    
    execute "ALTER TABLE bill_entries ADD PRIMARY KEY (bill_id, article_id);"
  end
end
