class AddAttachmentImageToEbays < ActiveRecord::Migration
  def self.up
    change_table :ebays do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :ebays, :image
  end
end
