class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    self.resource.organization = Organization.new
    respond_with self.resource
  end

  def create
    super
  end

  private

  def sign_up_params
    params.require(resource_name).permit(:email, :password,
      :password_confirmation, organization_attributes: [:name])
  end

end
