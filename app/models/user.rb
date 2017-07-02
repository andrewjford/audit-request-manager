class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_projects
  has_many :projects, through: :user_projects
  belongs_to :organization
  has_many :requests
  has_many :comments

  # validates :organization, presence: true

  def organization_attributes=(org_attributes)
    self.organization = Organization.find_or_create_by(name: org_attributes[:name])
  end

  def organization_name
    self.organization.name
  end

end
