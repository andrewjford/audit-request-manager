class CommentPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

end
