class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: :create
  before_action :configure_account_update_params, only: :update
  before_action :get_address, only: [:new, :edit, :update]

  def new
    build_resource {}
    self.resource.build_address
    respond_with self.resource
  end

  def edit
    resource.build_address unless resource.address 
  end

  private
  def get_address
    @cities = City.all
    @towns = Town.all
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit :email,
      :phone_number, :name, :avatar, :password, :password_confirmation,
      address_attributes: [:city_id, :town_id, :village, :home]}
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit :email,
      :phone_number, :name, :avatar, :password, :password_confirmation,
      address_attributes: [:city_id, :town_id, :village, :home]}
  end
end
