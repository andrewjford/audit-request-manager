class RequestSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :request_number, :created_at,
  :updated_at

  belongs_to :project
  belongs_to :user
  has_many :comments
end
