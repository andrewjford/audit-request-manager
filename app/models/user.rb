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
    # first attempts login with uid (incase a repeat login from same provider)
    # elsif accounts (very simply) for multiple identities by setting or
    # overwriting omniauth provider and uid when logging in through omniauth.
    # else creates new user
    if self.where(uid:auth.uid).exists?
      user = self.where(uid:auth.uid).first
    elsif self.where(email: auth.info.email).exists?
      user = self.where(email: auth.info.email).first
      user.update(provider: auth.provider, uid: auth.uid)
      user
    else
      user = self.create do |u|
        u.name = auth.info.name
        u.email = auth.info.email
        u.organization = Organization.find_or_create_by(name: "<not specified>")
        u.password = Devise.friendly_token[0,20]
        u.uid = auth.uid
        u.provider = auth.provider
      end
    end
  end

end
