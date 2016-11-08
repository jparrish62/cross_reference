class AddWalmartIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :walmart_product, foreign_key: true
  end
end
