class Request < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :comments

  def description_trunc
    description.size > 200 ? description[0..196]+"..." : description
  end
end
