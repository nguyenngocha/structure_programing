class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def show
    @product_types = ProductType.all
    @relation_products = Product.where(product_type_id: @product.product_type.id)
      .includes(:product_images)
    @cart_item = CartItem.new
  end

  private
  def load_product
    @product = Product.find_by_id params[:id]
    if @product.nil?
      flash[:danger] = t "admin.not_found", source: "product"
      redirect_to root_path
    end
  end
end
