class AddAttachmentPosterToLogPosts < ActiveRecord::Migration
  def self.up
    change_table :log_posts do |t|
      t.attachment :poster
    end
  end

  def self.down
    remove_attachment :log_posts, :poster
  end
end
