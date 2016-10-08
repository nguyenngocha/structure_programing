class Admin::ProductsController < Admin::AdminController
  before_action :load_data, only: [:new, :edit]
  before_action :load_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "admin.add_success", source: "product"
      redirect_to admin_products_path
    else
      load_data
      render :new
    end
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "admin.update_success", source: "product"
      redirect_to admin_product_path(@product)
    else
      load_data
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:success] = t "admin.delete_success", source: "product"
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit :name, :price,
      :description, :location, :product_color_id, :product_type_id
  end

  def load_product
    @product = Product.find_by_id params[:id]
    if @product.nil?
      flash[:danger] = t "admin.not_found", source: "product"
      redirect_to admin_products_path
    end
  end

  def load_data
    @product_types = ProductType.all
    @product_colors = ProductColor.all
  end
end
