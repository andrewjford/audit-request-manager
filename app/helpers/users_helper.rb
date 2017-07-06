module UsersHelper
  def user_name_and_link(user)
    if user
      link_to(user.name, user_path(user))
    else
      "<removed>"
    end
  end
end
