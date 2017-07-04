class OrganizationPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

end
