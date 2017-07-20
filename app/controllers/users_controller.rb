class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize :user
    @users = User.all
    
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @users}
    end

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
