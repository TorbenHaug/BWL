class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.integer :role
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
