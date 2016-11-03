class CartItemsController < ApplicationController
  before_action :load_cart_item, only: :destroy

  def create
    @cart = Cart.find_by_id params[:cart_item][:cart_id]
    @cart_item = CartItem.new cart_item_params
    @product = Product.find_by_id params[:cart_item][:product_id]

    if @cart_item.save
      flash[:success] = t "admin.add_success", source: "cart item"
    else
      flash[:danger] = t "admin.add_fail", source: "cart item"
    end
    redirect_to @product || root_path
  end

  def destroy
    @cart = @cart_item.cart
    @cart_item.destroy
    flash[:success] = t "admin.delete_success", source: "cart item"
    redirect_to @cart
  end

  private
  def cart_item_params
    params.require(:cart_item).permit :number, :product_id, :cart_id
  end

  def load_cart_item
    @cart_item = CartItem.find_by_id params[:id]
    if @cart_item.nil?
      flash[:danger] = t "admin.not_found", source: "cart item"
      redirect_to root_path
    end
  end
end
