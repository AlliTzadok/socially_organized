class CreateCalendarPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :calendar_posts do |t|
      t.date :date
      t.time :time
      t.integer :calendar_id
      t.integer :post_id

      t.timestamps
    end
  end
end
