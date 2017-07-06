class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    authorize :user
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    authorize :user
    @user.destroy
    redirect_to users_path
  end

end
