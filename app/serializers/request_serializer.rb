class RequestSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :request_number, :created_at,
    :updated_at, :user

  belongs_to :project
  belongs_to :user
  has_many :comments

  def user
    {
      id: object.user.id,
      organization_id: object.user.organization_id,
      name: object.user.name,
      email: object.user.email
    }
  end

  def comments
    object.comments.map do |comment|
      {
        id: comment.id,
        content: comment.content,
        created_at: comment.created_at,
        updated_at: comment.updated_at,
        user: {
          id: comment.user.id,
          name: comment.user.name,
          role: comment.user.role
        }
      }
    end
  end
end
