class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @organizations = Organization.all
  end
end
