class Calendar < ApplicationRecord
  has_many :user_calendars
  has_many :users, :through => :user_calendars
  has_many :calendar_posts, dependent: :destroy
  has_many :posts, :through => :calendar_posts
  belongs_to :admin, :class_name => :User, :foreign_key => :admin_id

  validates_presence_of :name

  #need method to find all calendar posts for today.
  #does it need to be calendar.posts.where(date: Date.current)? or some other way
  def todays_calendar
    current_user.calendars.each do |calendar|
      calendar.posts.where(date: Date.current)
    end
  end

  def collaborators?
    self.users.count > 1
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

end
