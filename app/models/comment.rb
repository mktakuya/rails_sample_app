class Comment < ActiveRecord::Base
  belongs_to :micropost
  default_scope -> { order('created_at ASC') }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_name, presence: true
  validates :user_id, presence: true
end
