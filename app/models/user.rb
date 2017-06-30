class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_projects
  has_many :projects, through: :user_projects
  belongs_to :organization

  accepts_nested_attributes_for :organization
  validates :organization, presence: true

  # def organization_attributes=(org_params)
  #   self.organization.build()
  # end
end
