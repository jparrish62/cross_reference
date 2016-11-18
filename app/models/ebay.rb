class Ebay < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  require 'httparty'
  require 'json'
  include HTTParty

  def self.get_request(term)
    request = get("http://open.api.ebay.com/shopping?callname=FindPopularItems&responseencoding=JSON&appid=JulianPa-CrossRef-PRD-c45f64428-36942d41&siteid=0&QueryKeywords=#{term}&version=713")
    ebay_search(request)
  end

  def self.ebay_search(term)
    searched_item = Ebay.where('name LIKE ?', "%#{term}%").limit(40)
    return get_request(term) if searched_item.empty?
    save_ebay_items(term)
    Ebay.where('name LIKE ?', "%#{term}%").limit(40)
  end

  def self.save_ebay_items(request)
    ebay_products = JSON.parse(request)
    ebay_products['ItemArray']['Item'].map do |ebay|
      ebay_items = Ebay.new
      ebay_items.name        = ebay['PrimaryCategoryName']
      ebay_items.price       = ebay['ConvertedCurrentPrice']['Value']
      ebay_items.status      = ebay['ListingStatus']
      ebay_items.product_id  = ebay['ItemID']
      ebay_items.bid_count   = ebay['BidCount']
      ebay_items.title       = ebay['Title']
      ebay_items.save!
      ebay_items
    end
  end
end
