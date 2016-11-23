class Bonanza < ApplicationRecord
  has_attached_file :image,                 styles: { medium: "300x300#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :comments,               as: :commentable
  belongs_to :user
  require 'json'
  require 'net/http'
  require 'cgi'

  def self.request_from_bonanza_api(call)
    basic_input_hash = { 'keywords' => call }
    basic_input_json = basic_input_hash.to_json
    basic_response   = Net::HTTP.new("api.bonanza.com").post(
    '/api_requests/standard_request',
    "findItemsByKeywords=#{basic_input_json}",
    {'X-BONANZLE-API-DEV-NAME' => '4b153ZvIjEY8UrG'})
    basic_response_json = basic_response.body
  end

  def self.search_bonanza_products(term)
    bonanza_products = Bonanza.where("title LIKE ?", "%#{term}%")
    if bonanza_products.empty?
       bonanza_request = request_from_bonanza_api(term)
       save_bonanza_products(bonanza_request)
       Bonanza.where("title LIKE ?", "%#{term}%")
     else
       bonanza_products
     end
  end

  def self.save_bonanza_products(items)
    bonanza_items   = JSON.parse(items)
    bonanza_items['findItemsByKeywordsResponse']['item'].map do |items|
      bonanza_product = Bonanza.new
      bonanza_product.title         = items['title']
      bonanza_product.price         = items['price']
      bonanza_product.image         = items['galleryURL']
      bonanza_product.item_id       = items['itemId']
      bonanza_product.selling_state = items['sellingState']
      bonanza_product.save!
      bonanza_product
    end
  end
end
