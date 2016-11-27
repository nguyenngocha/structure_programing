class Admin::CartsController < ApplicationController
  before_action :load_cart, only: [:destroy, :show, :accept_checkout]

  def index
    @carts = Cart.where.not(status: "init").order("status").page(params[:page]).per 10
  end

  def show
    @cart_items = @cart.cart_items
  end

  def destroy
    @cart.closed!
    flash[:success] = t "admin.closed"
    redirect_to admin_carts_path
  end

  def accept_checkout
    if @cart.active?
      @cart.shipping!
      flash[:success] = t "admin.success_accept_checkout", source: "cart of #{@cart.user.name}"
    else
      flash[:danger] = t "admin.fail_accept_checkout", source: "cart of #{@cart.user.name}"
    end
    redirect_to admin_carts_path
  end

  private
  def load_cart
    @cart = Cart.find_by_id params[:id] || params[:format]
    if @cart.nil?
      flash[:danger] = t "admin.not_found", source: "cart"
      redirect_to admin_carts_path
    end
  end
end
