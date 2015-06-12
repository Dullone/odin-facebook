class Post < ActiveRecord::Base
  default_scope { order(created_at: :desc) }
  validates :text, presence: true, length: { minimum: 1, maximum: 5000 }
  belongs_to :user
end
