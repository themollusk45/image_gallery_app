class Fixy < ActiveRecord::Migration
  def change
  	add_column :comments, :comment_likes_count, :integer
    remove_column :comments, :likes_count
  end
end
