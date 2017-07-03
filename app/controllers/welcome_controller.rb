class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      add_example_project(current_user) if current_user.projects.empty?
      @projects = current_user.projects
      render 'dashboard'
    end
  end

  def dashboard
    @projects = current_user.projects
  end

  private

  def add_example_project(current_user)
    #Add user to Demo Project
    project = Project.find_by(title: "Example Audit 2017")
    current_user.projects << project
  end
end
