class Organization < ApplicationRecord
  has_many :users
  has_many :projects, through: :users

  validates :name, presence: true
  validates :name, uniqueness: true

  def self.audit_firms
    Organization.joins(:users).where('role=?',1)
  end
end
