class StaticPagesController < ApplicationController
  before_action :search_product_relation,:load_products, :load_data, only: :home

  def home
    @products = @products.includes(:product_images)
    @products = @products.page(params[:page]).per Settings.paginate.static_page_products_for_page unless (params[:q] || params[:product_type_id])

    @relation_products = @relation_products.includes(:product_images)
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def load_products
    @products = Product.all
    @products = search_product_type(@products, params[:product_type_id]) if params[:product_type_id]
    @products = search_product_name(@products, params[:q]) if params[:q]
  end

  def search_product_relation
    @relation_products = Product.all
    @relation_products = search_product_name(@relation_products, params[:q].split.first) if params[:q]
  end

  def load_data
    @product_types = ProductType.all
    @load_more = false
    @load_more = true unless params[:q] || params[:product_type_id]
  end

  def search_product_name products, name
    products.ransack(name_cont: name).result
  end

  def search_product_type products, product_type_id
    products.where product_type_id: product_type_id
  end
end
