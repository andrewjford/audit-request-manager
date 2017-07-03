class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @projects = current_user.projects
      render 'dashboard'
    end
  end

  def dashboard
    @projects = current_user.projects
  end
end
