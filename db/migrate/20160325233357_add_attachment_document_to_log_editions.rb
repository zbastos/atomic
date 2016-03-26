class AddAttachmentDocumentToLogEditions < ActiveRecord::Migration
  def self.up
    change_table :log_editions do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :log_editions, :document
  end
end
