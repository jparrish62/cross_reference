class AddAttachmentImageToWalmartProducts < ActiveRecord::Migration
  def self.up
    change_table :walmart_products do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :walmart_products, :image
  end
end
