class CreateUserMeta < ActiveRecord::Migration
  def change
    create_table :user_meta do |t|
      t.integer :meta_key
      t.string :meta_value
      t.references :user
      t.timestamps null: false
    end
  end
end
