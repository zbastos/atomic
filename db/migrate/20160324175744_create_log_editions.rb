class CreateLogEditions < ActiveRecord::Migration
  def change
    create_table :log_editions do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
