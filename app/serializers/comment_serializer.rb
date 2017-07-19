class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :user

  def user
    {
      id: object.user.id,
      organization_id: object.user.organization_id,
      name: object.user.name,
      email: object.user.email
    }
  end

end
