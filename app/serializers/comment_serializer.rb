class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content

  belongs_to :request
  belongs_to :user
end
