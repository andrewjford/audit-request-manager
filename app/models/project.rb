class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :organizations, through: :users
  has_many :requests
  has_many :comments, through: :requests

  validates :title, presence: true, uniqueness: true

  default_scope {order(created_at: :asc)}

  def user_attributes=(user_attributes)
    user_attributes.values.each do |user_attribute|
      user = User.find_by(email: user_attribute[:email])
      if user
        self.users << user unless self.users.include?(user)
      end
    end
  end

  def increase_request_count
    #this is called in the request model after a new request is created for the project
    self.request_counter += 1
    self.save
  end

  def filtered_requests(status_code)
    if status_code.nil?
      self.requests.order(:request_number)
    elsif status_code == "open"
      self.requests.where(status: 'Open').order(:request_number)
    elsif status_code == "client_submitted"
      self.requests.where(status: 'Client Submitted').order(:request_number)
    elsif status_code == "closed"
      self.requests.where(status: 'Closed').order(:request_number)
    else
      self.requests.order(:request_number)
    end
  end

end
