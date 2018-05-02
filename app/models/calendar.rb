class Calendar < ApplicationRecord

  has_many :user_calendars
  has_many :users, :through => :user_calendars
  has_many :calendar_posts
  has_many :posts, :through => :calendar_posts
  belongs_to :admin, :class_name => :User, :foreign_key => :admin_id

  #need method to find all calendar posts for today.
  #does it need to be calendar.posts.where(date: Date.current)? or some other way
  def todays_calendar
    current_user.calendars.each do |calendar|
      calendar.posts.where(date: Date.current)
    end
  end

  def collaborators?
    self.users.count > 0
  end

  def calendar_admin?(user)
    self.admin_id == user.id
  end

  def rough_draft_posts
    self.posts.select do |post|
      post.finalized == false
    end
  end

  def finalized_posts
    self.posts.select do |post|
      post.finalized == true
    end
  end

  #need method to query and verify current user is a user on the calendar
  def authorized_for_calendar

  end
end
