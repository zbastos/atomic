class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name, limit: 75
      t.string :benefits
      t.attachment :logo
      t.string :link

      t.timestamps null: false
    end
  end
end
