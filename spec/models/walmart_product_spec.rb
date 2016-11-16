require 'rails_helper'
RSpec.describe WalmartProduct, type: :model do
  it "is valid if it has a product name" do
    walmart_product = FactoryGirl.build(:walmart_product, product_name: nil)
    expect(walmart_product).not_to be_valid
  end
end
