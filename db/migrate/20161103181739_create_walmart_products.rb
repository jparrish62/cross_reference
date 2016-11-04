class CreateWalmartProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :walmart_products do |t|
      t.integer :item_id
      t.string :product_name
      t.integer :parent_id
      t.integer :sales_price
      t.text :product_description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
