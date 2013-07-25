class CommentLike < ActiveRecord::Base
	attr_accessible :comment_id, :user_id
  belongs_to :comment, :counter_cache => true
  #attr_accessible :comment_id, :user_id
end
