class WalmartProduct < ApplicationRecord
  validates :product_name, presence: true 
  has_attached_file :image, styles: { medium: "300x300#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :comments, as: :commentable
  belongs_to :user
  require 'httparty'
  require 'json'
  include HTTParty

  def self.advanced_search(params)
    products = basic_search(params[:name])
    products = products.where("product_name LIKE ?",     "%#{params[:name]}%")      if params[:name].present?
    products = products.where("sales_price >= ?",        params[:min_price])        if params[:min_price].present?
    products = products.where("sales_price <= ?",        params[:max_price])        if params[:max_price].present?
    products = products.where("product_category LIKE ?", "%#{params[:category]}%")  if params[:category].present?
    products = products.where("item_id LIKE ?",          params[:item_id])          if params[:item_id].present?
    products
  end

  def self.basic_search(term)
    walmart_products = WalmartProduct.where(["product_name LIKE ?", "%#{term}%"]).limit(40)
    if walmart_products.empty?
      request = url_request(term)
      save_api_items(request)
      WalmartProduct.where(["product_name LIKE ?", "%#{term}%"]).limit(40)
    else
      walmart_products
    end
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
      requested_item.product_category     = item['categoryPath']
      requested_item.save!
      requested_item
    end
  end
end
