class CalendarPost < ApplicationRecord
  belongs_to :calendar
  belongs_to :post
  scope :post_today, -> { where(date: Date.current)}
  validates :post_id, uniqueness: { scope: :calendar_id}



end
