class CalendarPost < ApplicationRecord
  belongs_to :calendar
  belongs_to :post
  scope :post_today, -> { where(date: Date.current)

  def post=(post_id)
    binding.pry
    post = Post.find(id: post_id)
    self.post = post
  end

  def post
    self.post if self.post
  end

  def calendar=(calendar_id)
    calendar = Calendar.find(id: calendar_id)
    self.calendar = calendar
  end

  def calendar
    self.calendar if self.calendar
  end
end
