class WalmartProduct < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :comments, as: :commentable 
  belongs_to :user
  require 'httparty'
  require 'json'
  include HTTParty

  def self.get_product_data_base
    'SELECT * FROM walmart_products WHERE (walmart_products.product_name = term) LIMIT 10'
  end

  def self.search(term)
    return get_product_data_base if WalmartProduct.exists?(term)
    request = get("http://api.walmartlabs.com/v1/search?query=#{term}&format=json&apiKey=5y3ju35n6vxa9t6p7xpbhy9g")
    save_api_items(request)
    get_product_data_base
  end

  def self.save_api_items(uri_request)
    walmart_data      = JSON.parse(uri_request.body)
    walmart_data['items'].map do |item|
      requested_item  = WalmartProduct.new
      requested_item.item_id              = item['itemId']
      requested_item.product_name         = item['name']
      requested_item.product_description  = item['longDescription']
      requested_item.sales_price          = item['salePrice']
      requested_item.image                = item['mediumImage']
      requested_item.save!
    end
    get_product_data_base
  end
end
