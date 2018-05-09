class User < ApplicationRecord
  has_many :user_calendars
  has_many :calendars, through: :user_calendars
  has_many :posts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:github]

  validates :email, uniqueness: true
  validates :email, confirmation: {case_sensitive: false}
  validates :password, confirmation: {case_sensitive: true}
  validates :password, length: { minimum: 6}
  validates :email, :password, :name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.uid = auth.uid
      user.provider = auth.provider
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name  #assuming the user model has a name
      user.oauth_token = auth.credentials.token
      user.image = auth.info.image #assuming the user model has an image
      user.save!
    end
  end

  def all_posts
    authored = self.posts
    self.calendars.each do |calendar|
      calendar.posts.each do |post|
        authored << post
      end
    end
    authored
  end


  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end

end
