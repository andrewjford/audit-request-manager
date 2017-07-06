module ApplicationHelper
  def org_link
    if current_user.admin?
      content_tag(:li, link_to("Organizations", organizations_path))
    end
  end

  def users_link
    if current_user.admin?
      content_tag(:li, link_to("Users", users_path))
    end
  end
end
