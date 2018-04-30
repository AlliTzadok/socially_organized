class CalendarPost < ApplicationRecord
  belongs_to :calendar
  belongs_to :post
end
