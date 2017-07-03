class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :request

  validates :content, presence: true

  def author
    self.user.name
  end

end
