class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :description
      t.float :price
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
