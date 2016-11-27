class CartsController < ApplicationController
  before_action :load_cart, only: [:show, :checkout]
  before_action :load_product_type, only: :show
  before_action :load_cart_items, only: :show

  def checkout
    if current_or_guest_user.guest?
      redirect_to edit_user_path(@current_user)
    elsif @cart.cart_items.nil?
      flash[:danger] = "can't not checkout becase cart is empty"
      redirect_to root_path
    else
      if @cart.init?
        @cart.active!
        flash[:success] = t "user.checkout_success", resource: @cart.id
      else
        flash[:flash] = t "user.checkout_false", resource: @cart.id
      end
      redirect_to cart_path(@cart)
    end
  end

  private
  def load_cart
    @cart = Cart.find_by_id params[:id] || params[:format]
    if @cart.nil?
      t "admin.not_found", source: "cart"
      redirect_to root_path
    end
  end

  def load_cart_items
    @cart_items = @cart.cart_items.includes(product: :product_images)
  end

  def load_product_type
    @product_types = ProductType.all
  end
end
