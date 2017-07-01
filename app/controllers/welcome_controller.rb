class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      render 'dashboard'
    end
  end

  def dashboard
    @user = current_user
  end
end
