class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    self.resource.organization = Organization.new
    respond_with self.resource
  end

  def create
    super
  end

  def update
    super
  end

  private
  # 
  # def update_resource(resource, params)
  #
  # end

  def sign_up_params
    params.require(resource_name).permit(:email, :password,
      :password_confirmation, :name, organization_attributes: [:name])
  end

  def account_update_params
    params.require(resource_name).permit(:email, :password, :name,
      :password_confirmation, :current_password, organization_attributes: [:name])
  end

end
