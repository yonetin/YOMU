class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :url
      t.string :content
      t.integer :words_count
      t.integer :user_id

      t.timestamps
    end
    add_index :articles, [:user_id, :created_at]
  end
end
