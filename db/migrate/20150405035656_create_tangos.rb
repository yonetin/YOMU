class CreateTangos < ActiveRecord::Migration
  def change
    create_table :tangos do |t|
      t.string :word
      t.string :mean
      t.integer :user_id
      t.integer :article_id

      t.timestamps
    end
  end
end
