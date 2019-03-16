class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :image_data
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
