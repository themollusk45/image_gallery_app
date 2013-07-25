class Comment < ActiveRecord::Base
  attr_accessible :content, :gallery_id, :hate, :like, :parent_id, :pic_id, :rating
  belongs_to :user
  belongs_to :pic
  belongs_to :gallery
  belongs_to :parent, :class_name => 'Comment', :foreign_key => "parent_id"
  has_many :children, :class_name => 'Comment', :foreign_key => "parent_id" #not currently used
  has_many :likes
  acts_as_tree :order => "created_at" #not currently used


  
end
