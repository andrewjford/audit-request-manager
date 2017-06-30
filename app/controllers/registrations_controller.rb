class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    self.resource.organization = Organization.new
    respond_with self.resource
  end

  private

  def sign_up_params
    params.require(resource_name).permit(:email, :password,
      :password_confirmation)
  end

end
