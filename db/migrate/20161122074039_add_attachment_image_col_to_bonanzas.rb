class AddAttachmentImageColToBonanzas < ActiveRecord::Migration
  def self.up
    change_table :bonanzas do |t|
      t.attachment :image_col
    end
  end

  def self.down
    remove_attachment :bonanzas, :image_col
  end
end
