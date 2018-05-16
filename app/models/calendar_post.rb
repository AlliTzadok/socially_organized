class CalendarPost < ApplicationRecord
  belongs_to :calendar
  belongs_to :post
  validates :post_id, uniqueness: { scope: :calendar_id}

end
