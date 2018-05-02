class AddAdminToCalendar < ActiveRecord::Migration[5.2]
  def change
    add_column :calendars, :admin_id, :integer
  end
end
