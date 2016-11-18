class CreateEbays < ActiveRecord::Migration[5.0]
  def change
    create_table :ebays do |t|
      t.string :name
      t.decimal :price
      t.string :status
      t.integer :product_id
      t.integer :bid_count
      t.text :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
