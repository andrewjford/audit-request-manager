module ApplicationHelper
  def org_link
    if current_user.admin?
      content_tag(:li, link_to("Organizations", organizations_path))
    end
  end
end
