class WalmartProduct < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :comments, as: :commentable
  belongs_to :user
  require 'httparty'
  require 'json'
  include HTTParty

  def self.search(params)
    if params[:category].present? || params[:min_price].present? || params[:max_price].present?
      advanced_search(params)
    else
      basic_search(params[:search])
    end
  end

  def self.advanced_search(params)
    if WalmartProduct.exist?(params)
      products = WalmartProduct.all
      products = products.where(["product_name LIKE ?",  name])
      products = products.where(["item_category LIKE ?", category])
      products = products.where(["sales_price >= ?",     min_price])
      products = products.where(["sales_price <= ?",     max_price])
      products
    else
      request = url_request(term)
      save_api_items(request)
    end
  end

  def self.basic_search(term)
    request = url_request(term)
    save_api_items(request)
  end

  def self.url_request(term)
    get("http://api.walmartlabs.com/v1/search?query=#{term}&format=json&apiKey=5y3ju35n6vxa9t6p7xpbhy9g")
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
      requested_item
    end
  end
end
