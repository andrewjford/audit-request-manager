class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :request

  validates :content, presence: true

  def author
    self.user.name
  end

  def post_date
    self.created_at.strftime("%b %e, %Y %l:%M %p")
  end
end
