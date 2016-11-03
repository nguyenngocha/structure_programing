class CartsController < ApplicationController
  before_action :load_cart, only: :show
  before_action :load_product_type, only: :show

  def show
    @cart_items = @cart.cart_items.includes(product: :product_images)
  end

  private
  def load_cart
    @cart = Cart.find_by_id params[:id]
    if @cart.nil?
      t "admin.not_found", source: "cart"
      redirect_to root_path
    end
  end
  def load_product_type
    @product_types = ProductType.all
  end
end
