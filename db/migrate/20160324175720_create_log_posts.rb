class CreateLogPosts < ActiveRecord::Migration
  def change
    create_table :log_posts do |t|
      t.string :title
      t.text :body

      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
