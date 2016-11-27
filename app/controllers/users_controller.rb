class UsersController < ApplicationController
  before_action :load_resource, only: :edit

  def edit
    @current_user.build_address unless @current_user.address
  end

  def update
    if @current_user.update_attributes user_params
      @current_user.buyer!
      cart = @current_user.carts.find_by status: "init"
      redirect_to checkout_path(cart)
    else
      load_resource
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit [:email, :name, :avatar,
      :password, :password_confirmation, :phone_number,
      address_attributes: [:id, :city_id, :town_id, :village, :home]]
  end

  def load_resource
    @cities = City.all
    @towns = Town.all
  end
end
