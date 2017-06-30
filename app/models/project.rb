class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :organizations, through: :users

  validates :title, presence: true, uniqueness: true

  def user_attributes=(user_attributes)
    user_attributes.values.each do |user_attribute|
      user = User.find_by(email: user_attribute[:email])
      if user
        self.users << user unless self.users.include?(user)
      end
    end
  end

end
