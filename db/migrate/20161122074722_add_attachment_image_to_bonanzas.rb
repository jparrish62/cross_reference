class AddAttachmentImageToBonanzas < ActiveRecord::Migration
  def self.up
    change_table :bonanzas do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :bonanzas, :image
  end
end
