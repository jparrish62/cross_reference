class WalmartProductsController < ApplicationController
  def new
    @walmart_product = WalmartProduct.new
  end

  def show
    @walmart = WalmartProduct.find(params[:id])
  end

  def product_advanced_search
    @advanced_search = WalmartProduct.advanced_search(params)
  end

  def index
    @walmart_products = WalmartProduct.basic_search(params[:search])
  end
end
