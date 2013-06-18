class Pic < ActiveRecord::Base
  attr_accessible :description, :gallery_id, :title, :pic_file
  
  belongs_to :user#should this go away??
  belongs_to :gallery

  validates :user_id, presence: true
  validates :title, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }

  has_attached_file :pic_file, styles: {
  	thumb: '100x100>',
  	medium: '300x300>'
  }
  
  default_scope order: 'pics.created_at DESC'
end
