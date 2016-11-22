class CreateBonanzas < ActiveRecord::Migration[5.0]
  def change
    create_table :bonanzas do |t|
      t.string :title
      t.integer :item_id
      t.string :image
      t.decimal :price
      t.string :selling_state
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
