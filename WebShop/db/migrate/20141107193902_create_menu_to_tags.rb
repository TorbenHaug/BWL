class CreateMenuToTags < ActiveRecord::Migration
  def change
    create_table :menu_to_tags do |t|
      t.integer :menu_id
      t.integer :tag_id
      
      t.timestamps
    end
  end
end
