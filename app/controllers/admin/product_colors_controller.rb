class Admin::ProductColorsController < Admin::AdminController
  before_action :load_product_color, only: [:edit, :update, :destroy]

  def index
    @product_colors = ProductColor.all
  end

  def new
    @product_color = ProductColor.new
  end

  def create
    @product_color = ProductColor.new product_color_params
    if @product_color.save
      flash[:success] = t "admin.add_success", source: "product color"
      redirect_to admin_product_colors_path
    else
      render :new
    end
  end

  def update
    if @product_color.update_attributes product_color_params
      flash[:success] = t "admin.update_success", source: "product color"
      redirect_to admin_product_colors_path
    else
      render :edit
    end
  end

  def destroy
    @product_color.destroy
    flash[:success] = t "admin.delete_success", source: "product color"
    redirect_to admin_product_colors_path
  end

  private
  def product_color_params
    params.require(:product_color).permit :name
  end

  def load_product_color
    @product_color = ProductColor.find_by_id params[:id]
    if @product_color.nil?
      flash[:danger] = t "admin.not_found", source: "product color"
      redirect_to admin_product_colors_path
    end
  end
end
