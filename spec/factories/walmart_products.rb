FactoryGirl.define do
  factory :walmart_product do
    item_id 1
    product_name "MyString"
    product_category "MyText"
    parent_id 1
    sales_price 1
    product_description "MyText"
    user nil
  end
end
