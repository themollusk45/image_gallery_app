class AddLikesToComments < ActiveRecord::Migration
  def change
    add_column :comments, :likes_count, :integer
    remove_column :comments, :like
    remove_column :comments, :hate
    remove_column :comments, :rating
  end
end
