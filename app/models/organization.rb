class Organization < ApplicationRecord
  has_many :users
  has_many :projects, through :users
end
