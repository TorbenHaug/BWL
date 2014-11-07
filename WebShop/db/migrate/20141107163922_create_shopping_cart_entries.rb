class CreateShoppingCartEntries < ActiveRecord::Migration
  def change
    create_table :shopping_cart_entries do |t|
      t.integer :amount

      t.timestamps
    end
  end
end
