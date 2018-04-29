class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :link
      t.boolean :finalized, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
