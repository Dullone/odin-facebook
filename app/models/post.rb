class Post < ActiveRecord::Base
  default_scope { order(created_at: :desc) }
  validates :text, presence: true, length: { maximum: 5000 }
  belongs_to :user
end
