class CalendarPost < ApplicationRecord
  belongs_to :calendar
  belongs_to :post
  scope :post_today, -> { where(date: Date.current) }
end
