class Project < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :organizations,through: :projects 
end
