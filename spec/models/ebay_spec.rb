require 'rails_helper'

RSpec.describe Ebay, type: :model do
  it 'has a name' do
    ebay = FactoryGirl.build(:ebay, name: 'string')
    expect(ebay).to be_valid
  end

  it 'saves item name' do
    ebay = FactoryGirl.create(:ebay, name: 'joe')
    expect(ebay.name).to eq 'joe'
  end

  it 'is invalid without a name' do
    ebay = FactoryGirl.build(:ebay, name: nil)
    expect(ebay).not_to be_valid
  end

  it 'has a price' do
    ebay = FactoryGirl.build(:ebay, price: '9.99')
    expect(ebay).to be_valid
  end

  it 'saves price as decimal' do
    ebay = FactoryGirl.create(:ebay, price: '9.99')
    expect(ebay.price).to eq 9.99
  end

  it 'has a status' do
    ebay = FactoryGirl.build(:ebay, status: 'active')
    expect(ebay).to be_valid
  end

  it 'saves item status as a string' do
    ebay = FactoryGirl.create(:ebay, status: 'active')
    expect(ebay.status).to eq 'active'
  end

  it 'has a product id' do
    ebay = FactoryGirl.build(:ebay, product_id: 123)
    expect(ebay).to be_valid
  end

  it 'saves product id as an integer' do
    ebay = FactoryGirl.create(:ebay, product_id: 12345)
    expect(ebay.product_id).to eq 12345
  end

  it 'has a bid count' do
    ebay =  FactoryGirl.build(:ebay, bid_count: 123)
    expect(ebay).to be_valid
  end

  it 'saves bid count as an integer' do
    ebay = FactoryGirl.create(:ebay, bid_count: 12345)
    expect(ebay.bid_count).to eq 12345
  end

  it 'has a title' do
    ebay = FactoryGirl.build(:ebay, title: 'string')
    expect(ebay).to be_valid
  end

  it 'saves title as a string' do
    ebay = FactoryGirl.create(:ebay, title: 'Dog house')
    expect(ebay.title).to eq 'Dog house'
  end
end
