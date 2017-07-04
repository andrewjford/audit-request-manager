class Request < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :comments
  after_create :increase_project_count

  def description_trunc
    description.size > 200 ? description[0..196]+"..." : description
  end

  def comment_count
    self.comments.size
  end

  def increase_project_count
    self.project.increase_request_count
  end

end
