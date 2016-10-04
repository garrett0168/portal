class AddAttachmentDocumentToLogos < ActiveRecord::Migration
  def self.up
    change_table :logos do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :logos, :document
  end
end
