class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :organizations,through: :users

  validates :title, presence: true, uniqueness: true
  
end
