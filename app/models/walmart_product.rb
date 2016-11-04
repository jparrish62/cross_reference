class WalmartProduct < ApplicationRecord
  belongs_to :user
  require 'httparty'
  require 'json'
  include HTTParty

  def search(term)
    if WalmartProduct.exist?(term)
      SELECT 20 FROM walmart_products where walmart_products.product_name = term
    else
      request = self.class.get("http://api.walmartlabs.com/v1/search?query=#{term}&format=json&apiKey=5y3ju35n6vxa9t6p7xpbhy9g")
      save_api_items(request)
    end
  end

  def save_api_items(uri_request)
    walmart_data      = JSON.parse(uri_request)
    walmart_data.map do |data|
      requested_items = WalmartProduct.new
      requested_item.product_name         = data['items']['name']
      requested_item.product_description  = data['items']['longDescription']
      requested_item.sales_price          = data['items']['salePrice']
      requested_item.item_id              = data['items']['itemId']
      requested_item.save
    end
  end
end
