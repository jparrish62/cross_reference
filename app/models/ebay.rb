class Ebay < ApplicationRecord
  has_attached_file :image,                 styles: { medium: "300x300#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :name, presence: true
  has_many  :comments,                      as: :commentable 
  belongs_to :user
  require 'httparty'
  require 'json'
  include HTTParty

  def self.get_request(term)
    get("http://open.api.ebay.com/shopping?callname=QueryKeywords&responseencoding=JSON&appid=JulianPa-CrossRef-PRD-c45f64428-36942d41&siteid=0&FindP=#{term}&paginationInput.entriesPerPage=50&version=713")
  end

  def self.ebay_search(call)
    searched_item = Ebay.where(['name LIKE ?', "%#{call}%" ]).limit(40)
    if searched_item.empty?
      api_request = get_request(call)
      save_ebay_items(api_request)
      Ebay.where(['name LIKE ?', "%#{call}%" ]).limit(40)
    else
      searched_item
    end
  end

  def self.save_ebay_items(request)
    ebay_products = JSON.parse(request.to_json)
    binding.pry
    ebay_products["ItemArray"]["Item"].map do |ebay|
      ebay_items = Ebay.new
      ebay_items.name        = ebay['PrimaryCategoryName']
      ebay_items.price       = ebay['ConvertedCurrentPrice']['Value']
      ebay_items.status      = ebay['ListingStatus']
      ebay_items.product_id  = ebay['ItemID']
      ebay_items.bid_count   = ebay['BidCount']
      ebay_items.title       = ebay['Title']
      ebay_items.image       = ebay['GalleryURL']
      ebay_items.save!
      ebay_items
    end
  end
end
