class Post < ApplicationRecord
  has_many :calendar_posts
  has_many :calendars, through: :calendar_posts
  has_many :platform_posts
  has_many :platforms, through: :platform_posts
  belongs_to :user


  mount_uploader :picture, PictureUploader
  validates :title, presence: true

  def platform_attributes=(platform_attributes)
    if platform_attributes['platform_ids']
      platform_attributes.platform_ids.each do |id|
        platform = Platform.find(id: id)
        self.platforms << platform
      end
    end
    if platform_attributes['name'] != ""
      platform = Platform.find_or_create_by(name: platform_attributes['name'])
      self.platforms << platform
    end   
  end

end
