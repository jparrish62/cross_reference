class AddProductCategoryToWalmartProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :walmart_products, :product_category, :string
  end
end
