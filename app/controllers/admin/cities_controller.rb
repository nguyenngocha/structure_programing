class Admin::CitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin
  before_action :load_city, only: [:edit, :destroy, :update]
  before_action :build_city, only: :create

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    if @city.save
      flash[:success] = t "admin.add_success", source: "city"
      redirect_to admin_cities_path
    else
      render :new
    end
  end

  def update
    if @city.update_attributes city_params
      flash[:success] = t "admin.update_success", source: "city"
      redirect_to admin_cities_path
    else
      load_city
      render :edit
    end
  end

  def destroy
    if @city.destroy
      flash[:success] = t "admin.delete_success", source: "city"
    else
      flash[:danger] = t "admin.delete_fail", source: "city"
    end
    redirect_to admin_cities_path
  end

  private
  def city_params
    params.require(:city).permit :name
  end

  def load_city
    @city = City.find_by_id params[:id]
    if @city.nil?
      flash[:danger] = t "admin.not_found", source: "city"
      redirect_to admin_cities_path
    end
  end
  
  def build_city
    @city = City.new city_params
  end
end
