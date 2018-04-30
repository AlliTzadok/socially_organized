class Platform < ApplicationRecord
  has_many :platform_posts
  has_many :posts, through: :platform_posts
end
