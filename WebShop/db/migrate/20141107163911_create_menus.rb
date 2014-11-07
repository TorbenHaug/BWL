class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      
      t.integer :super_menu_id
      
      t.timestamps
    end
  end
end
