class CreateBillEntries < ActiveRecord::Migration
  def change
    create_table :bill_entries do |t|
      t.integer :amount

      t.timestamps
    end
  end
end
