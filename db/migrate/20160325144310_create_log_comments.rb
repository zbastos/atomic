class CreateLogComments < ActiveRecord::Migration
  def change
    create_table :log_comments do |t|
      t.text :body

      t.references :user
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
