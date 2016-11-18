class EbaysController < ApplicationController
  def new
    @ebay = Ebay.new
  end

  def index
    @ebay_products = Ebay.ebay_search(params[:search])
  end
end
