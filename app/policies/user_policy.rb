class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.joins(:user_projects).where('user_id=?', user.id)
      end
    end
  end

  def know_role?
    user.admin? || user.manager? || user.auditor?
  end

  def edit?
    record == user
  end

  def index?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
