class ProjectPolicy < ApplicationPolicy
  def create
    user.admin? || user.manager?
  end

  def update
    user.admin? || user.manager?
  end
end
