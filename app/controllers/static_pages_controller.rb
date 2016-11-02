class StaticPagesController < ApplicationController
  def home
    @products = Product.page(params[:page]).per Settings.paginate.static_page_products_for_page
  end
end
