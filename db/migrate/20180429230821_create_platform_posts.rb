class CreatePlatformPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :platform_posts do |t|
      t.integer :post_id
      t.integer :platform_id

      t.timestamps
    end
  end
end
