class AddAttachmentDocumentToFlyers < ActiveRecord::Migration
  def self.up
    change_table :flyers do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :flyers, :document
  end
end
