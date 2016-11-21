class AddEbayProductIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :ebay, foreign_key: true
  end
end
