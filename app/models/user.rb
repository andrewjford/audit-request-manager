class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

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
    self.organization ? self.organization.name : nil
  end

  def self.from_omniauth(auth)
    data = auth.info
    user = User.find_or_create_by(email: data['email']) do |u|
      u.name = data['name']
      u.email = data['email']
      u.organization = Organization.find_or_create_by(name: "<not specified>")
      u.password = Devise.friendly_token[0,20]
    end
  end

end
