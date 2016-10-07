class Admin::TownsController < Admin::AdminController
  before_action :load_city, only: [:new, :edit]
  before_action :load_town, only: [:edit, :update, :destroy]

  def index
    @towns = Town.all
  end

  def new
    @town = Town.new
  end

  def create
    @town = Town.new town_params
    if @town.save
      flash[:success] = t "admin.add_success", source: "town"
      redirect_to admin_towns_path
    else
      load_city
      render :new
    end
  end

  def update
    if @town.update_attributes town_params
      flash[:success] = t "admin.update_success", source: "town"
      redirect_to admin_towns_path
    else
      load_city
      render :edit
    end
  end

  def destroy
    flash[:success] = t "admin.delete_success", source: "town"
    redirect_to admin_towns_path
  end

  private
  def load_town
    @town = Town.find_by_id params[:id]
    if @town.nil?
      flash[:danger] = t "admin.not_found", source: "town"
      redirect_to admin_towns_path
    end
  end

  def town_params
    params.require(:town).permit :city_id, :name
  end

  def load_city
    @cities = City.all
  end
end
