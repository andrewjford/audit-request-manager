class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :organizations, through: :users

  validates :title, presence: true, uniqueness: true

  def add_user=(email_string)
    user = User.find_by(email:email_string)
    if user
      self.users << user
    end
  end
end
