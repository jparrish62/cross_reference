class WalmartProductsController < ApplicationController
  def new
    @walmart_product = WalmartProduct.new
  end

  def index
    @walmart_products = WalmartProduct.all.order('created_at DESC')
    if params[:search]
      @walmart_products = WalmartProduct.search(params[:search])
    else
      @walmart_products = WalmartProduct.all.order('created_at DESC')
    end
  end

  def create
    @walmart_products = WalmartProduct.search(params[:search])
  end

  private

end
