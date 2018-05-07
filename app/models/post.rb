class Post < ApplicationRecord
  has_many :calendar_posts
  has_many :calendars, through: :calendar_posts
  has_many :platform_posts
  has_many :platforms, through: :platform_posts
  belongs_to :user
  scope :finalized, -> { where(finalized: true)}
  scope :drafted, -> { where(finalized: false)}

  mount_uploader :picture, PictureUploader
  validates :title, presence: true

  def platform_posts_attributes=(platform_posts_attributes)
    if platform_posts_attributes['platform_ids']
      platform_posts_attributes.platform_ids.each do |id|
        platform = Platform.find(id: id)
        self.platforms << platform
      end
    end
    if platform_posts_attributes['name'] != ""
      platform = Platform.find_or_create_by(name: platform_posts_attributes['name'])
      self.platforms << platform
    end
  end


end
