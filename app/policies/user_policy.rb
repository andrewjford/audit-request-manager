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

  def update?
    user.admin?
  end
end
