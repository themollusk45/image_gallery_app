class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.integer :gallery_id

      t.timestamps
    end
    add_index :pics, [:user_id, :created_at]
  end
end
