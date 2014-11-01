class AddAdminTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_token, :boolean, default: false
  end
end
