class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_projects
  has_many :projects, through: :user_projects
  belongs_to :organization

  # validates :organization, presence: true

  def organization_attributes=(org_attributes)
    self.organization = Organization.find_or_create_by(name: org_attributes[:name])
  end

end
