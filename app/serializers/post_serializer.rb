class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :link, :finalized, :picture
  belongs_to :user

end
