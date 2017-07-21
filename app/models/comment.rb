class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :request
  belongs_to :project

  validates :content, presence: true

  default_scope {order(created_at: :asc)}

  def author
    self.user.name
  end

end
