class Gallery < ActiveRecord::Base
  attr_accessible :description, :title
  belongs_to :user
  #has_many :images # might need this for gallery.images? not sure

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }
  validates :user_id, presence: true

  default_scope order: 'galleries.created_at DESC'
end
