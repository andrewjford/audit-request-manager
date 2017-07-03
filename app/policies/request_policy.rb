class RequestPolicy < ApplicationPolicy
  def create?
    user.admin? || user.manager? || user.auditor?
  end

  def permitted_attributes
    if user.client?
      [:status]
    else
      [:status, :title, :description]
    end
  end
end
