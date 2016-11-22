class BonanzasController < ApplicationController

  def index
    @bonanza_products = Bonanza.search_bonanza_products(params[:search])
  end

  def show
    @bonanza_product = Bonanza.find(params[:id])
  end
end
