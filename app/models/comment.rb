class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :text, presence: true, length: { maximum: 5000 }
  validates :user, presence: true
  validates :post, presence: true
end
