class CommentPolicy < ApplicationPolicy
  def create?
    user.persisted?
  end

  def edit?
    user.admin? || record.user == user
  end

  def update?
    user.admin? || record.user == user
  end

  def destroy?
    user.admin? || record.user == user
  end
end
