class Admin::CitiesController < Admin::AdminController
  before_action :load_city, only: [:edit, :destroy, :update]
  before_action :build_city, only: :create

  def index
    @cities = City.page(params[:page]).per Settings.paginate.cities_per_page
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
      render :edit
    end
  end

  def destroy
    @city.destroy
    flash[:success] = t "admin.delete_success", source: "city"
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
