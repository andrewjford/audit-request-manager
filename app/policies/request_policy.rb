class RequestPolicy < ApplicationPolicy

  def new?
    user.admin? || user.manager? || user.auditor?
  end

  def create?
    user.admin? || user.manager? || user.auditor?
  end

  def destroy?
    user.admin? || user.manager?
  end

  def permitted_attributes
    if user.client?
      [:status]
    else
      [:status, :title, :description]
    end
  end
end
