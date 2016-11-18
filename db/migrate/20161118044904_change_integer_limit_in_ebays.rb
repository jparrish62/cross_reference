class ChangeIntegerLimitInEbays < ActiveRecord::Migration[5.0]
  def change
    change_column :ebays, :product_id, :integer, limit: 8
    change_column :ebays, :bid_count,  :integer, limit: 8
  end
end
