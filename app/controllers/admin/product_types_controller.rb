class Admin::ProductTypesController < Admin::AdminController
  before_action :load_product_type, only: [:edit, :update, :destroy]

  def index
    @product_types = ProductType.page(params[:page]).per Settings.paginate.product_types_for_page
  end

  def new
    @product_type = ProductType.new
  end

  def create
    @product_type = ProductType.new product_type_params
    if @product_type.save
      flash[:success] = t "admin.add_success", source: "product type"
      redirect_to admin_product_types_path
    else
    	render :new
    end
  end

  def update
    if @product_type.update_attributes product_type_params
      flash[:success] = t "admin.update_success", source: "product type"
      redirect_to admin_product_types_path
    else
      render :edit
    end
  end

  def destroy
    @product_type.destroy
    flash[:success] = t "admin.destroy_success", source: "product type"
    redirect_to admin_product_types_path
  end

  private
  def product_type_params
    params.require(:product_type).permit :name
  end

  def load_product_type
    @product_type = ProductType.find_by_id params[:id]
    if @product_type.nil?
      flash[:danger] = t "admin.not_found", source: "Product Type"
    redirect_to admin_product_types_path
    end
  end
end
