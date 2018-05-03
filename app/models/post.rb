class Post < ApplicationRecord
  has_many :calendar_posts
  has_many :calendars, through: :calendar_posts
  has_many :platform_posts
  has_many :platforms, through: :platform_posts
  belongs_to :user


  mount_uploader :picture, PictureUploader
  validates :title, presence: true

  def platform_attributes=(platform_attributes)
   platform_attributes.values.each do |platform_attribute|
      platform = Platform.find_or_create_by(platform_attribute)
      self.platforms << platform
    end
  end

end
