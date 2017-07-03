class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.joins(:user_projects).where('user_id=?', user.id)
      end
    end
  end

  def new?
    user.admin? || user.manager?
  end

  def edit?
    user.admin? || user.manager?
  end

  def create?
    user.admin? || user.manager?
  end

  def update?
    user.admin? || user.manager?
  end

  def destroy?
    user.admin?
  end
end
