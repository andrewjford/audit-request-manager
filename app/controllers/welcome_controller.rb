class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      render :template => 'users/show'
    end
  end
end
