require 'rails_helper'

RSpec.describe Bonanza, type: :model do
  it 'has a title field' do
    title =  FactoryGirl.build(:bonanza, title: 'title')
    expect(title).to be_valid
  end
   it 'saves title att' do
     bonanza = FactoryGirl.create(:bonanza, title: 'SuperMan')
     expect(bonanza.title).to eq 'SuperMan'
   end

   it 'has a price att' do
     bonanza = FactoryGirl.build(:bonanza, price: 2.99)
     expect(bonanza).to be_valid
   end

   it 'saves price as a decimal' do
     bonanza = FactoryGirl.create(:bonanza, price: 2.99)
     expect(bonanza.price).to eq 2.99
   end

   it 'has an item id att' do
     bonanza = FactoryGirl.build(:bonanza, item_id: 123)
     expect(bonanza).to be_valid
   end

   it 'saves item id as an integer' do
     bonanza = FactoryGirl.create(:bonanza, item_id: 123)
     expect(bonanza.item_id).to eq 123
   end

   it 'has an image att' do
     bonanza = FactoryGirl.build(:bonanza, image:"http...")
     expect(bonanza).to be_valid
   end

   it 'save image url as a string' do
     bonanza = FactoryGirl.create(:bonanza, image: 'http...')
     expect(bonanza.image).to eq 'http...'
   end

   it 'has a selling state att' do
     bonanza =  FactoryGirl.build(:bonanza, selling_state: 'active')
     expect(bonanza).to be_valid
   end

   it 'saves selling state as a string' do
     bonanza = FactoryGirl.create(:bonanza, selling_state: 'active')
     expect(bonanza.selling_state).to eq 'active'
   end
end
