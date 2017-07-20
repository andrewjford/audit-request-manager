class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :user

  belongs_to :request
  belongs_to :project

  def user
    {
      id: object.user.id,
      organization_id: object.user.organization_id,
      name: object.user.name,
      email: object.user.email,
      is_client: object.user.client?
    }
  end

end
