class OrganizationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @organizations = Organization.all
    authorize :organization
  end

  def auditors
    @organizations = Organization.audit_firms
    authorize :organization, :index?
  end
end
