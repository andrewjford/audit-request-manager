class Request < ApplicationRecord
  belongs_to :project
  belongs_to :user

  def description_trunc
    description.size > 100 ? description[0..96]+"..." : description
  end
end
