class Post < ActiveRecord::Base
  default_scope { order(created_at: :desc) }
  validates :text, presence: true, length: { maximum: 5000 }
  belongs_to :user
  has_many :likes
  has_many :comments
  has_many :user_likes, through: :likes, class_name: 'User',
                        source: 'user',
                        foreign_key: 'user_id'
end
