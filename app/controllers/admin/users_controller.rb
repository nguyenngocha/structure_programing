class Admin::UsersController < ApplicationController
  before_action :load_address, only: [:new, :edit]
  before_action :find_user, only: [:edit, :edit, :update, :destroy]

  def index
    @users = User.buyer
  end

  def new
    @user = User.new
    @user.build_address
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "admin.add_success", source: "user"
      redirect_to admin_users_path
    else
      load_address
      render :new
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "admin.update_success", source: "user"
      redirect_to admin_users_path
    else
      load_address
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = t "admin.delete_success", source: "user"
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit [:email, :name, :avatar,
      :password, :password_confirmation, :phone_number,
      address_attributes: [:id, :city_id, :town_id, :village, :home]]
  end

  def load_address
    @cities = City.all
    @towns = Town.all
  end

  def find_user
    @user = User.find_by_id params[:id]
    if @user.nil?
      flash[:danger] = t "admin.not_found", source: "user"
      redirect_to admin_users_path
    end
  end
end
