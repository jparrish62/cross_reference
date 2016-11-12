class WalmartProductsController < ApplicationController
  def new
    @walmart_product = WalmartProduct.new
  end

  def show
    @walmart = WalmartProduct.find(params[:id])
  end

  def index
      @walmart_products = WalmartProduct.where(["product_name LIKE ?", "%#{params[:search]}%"]).limit(40)
    if @walmart_products.empty?
      @walmart_products = WalmartProduct.basic_search(params[:search])
    end
  end
end
