class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :gallery_id
      t.integer :pic_id
      t.integer :parent_id
      t.integer :like, :default => 0
      t.integer :hate, :default => 0
      t.integer :rating, :default => 0

      t.timestamps
    end
      add_index :comments, [:user_id, :created_at]
  end
end
