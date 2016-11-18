require 'rails_helper'
RSpec.describe WalmartProduct, type: :model do

  it "is valid if it has a product name" do
    walmart_product = FactoryGirl.build(:walmart_product, product_name: nil)
    expect(walmart_product).not_to be_valid
  end

  it 'has a valid product name' do
    walmart_product = FactoryGirl.build(:walmart_product, product_name: 'Ipod')
    expect(walmart_product).to be_valid
  end

  it 'is valid if it has a sales price' do
    walmart_product = FactoryGirl.build(:walmart_product, item_id: 123)
    expect(walmart_product).to be_valid
  end

  it 'has a valid product description' do
    walmart_product = FactoryGirl.build(:walmart_product, product_description: 'text')
    expect(walmart_product).to be_valid
  end

  it 'is valid with a product category' do
    walmart_product = FactoryGirl.build(:walmart_product, product_category: 'text')
    expect(walmart_product).to be_valid
  end

  let(:ipod) { WalmartProduct.create!(product_name: 'ipod') }
  let(:bike) { WalmartProduct.create!(product_name: 'bike') }

  it 'returns items that match the search' do
    basic_search = WalmartProduct.basic_search('bike')
    expect(basic_search).to eq([bike])
  end
end
