module ProjectsHelper
  def edit_profile_link(project)
    link_to 'Edit', edit_project_path(project) if policy(project).edit?
  end
end
