class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.joins(project: :user_projects).where('user_projects.user_id=?', user.id)
      end
    end
  end

  def show?
    user.admin? || record.project.users.include?(user)
  end

  def create?
    user.admin? || user.manager? && record.project.users.include?(user) ||
    user.auditor? && record.project.users.include?(user)
  end

  def update?
    user.admin? || record.project.users.include?(user)
  end

  def destroy?
    user.admin? || user.manager? && record.project.users.include?(user)
  end

  def permitted_attributes
    if user.client?
      [:status]
    else
      [:status, :title, :description]
    end
  end
end
