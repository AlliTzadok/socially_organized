class Post < ApplicationRecord
  has_many :calendar_posts
  has_many :calendars, through: :calendar_posts
  has_many :platform_posts
  has_many :platforms, through: :platform_posts
  belongs_to :user

  mount_uploader :picture, PictureUploader
  validates: :name, presence: true
end
