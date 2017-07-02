class Request < ApplicationRecord
  belongs_to :project
  belongs_to :user

  def description_trunc
    description.size > 200 ? description[0..196]+"..." : description
  end
end
