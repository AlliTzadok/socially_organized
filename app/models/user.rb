class User < ApplicationRecord
  has_many :user_calendars
  has_many :calendars, through: :user_calendars
  has_many :posts


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  validates :email, uniqueness: true
  validates :email, confirmation: {case_sensitive: false}
  validates :password, confirmation: {case_sensitive: true}
  validates :password, length: { minimum: 2}
  validates :email, :password, :name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name  #assuming the user model has a name
      user.image = auth.info.image #assuming the user model has an image
    end
  end

  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end

end
