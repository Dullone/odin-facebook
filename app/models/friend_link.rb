class FriendLink < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'
  validates :user_id,   presence: true
  validates :friend_id, presence: true
  validates_inclusion_of :status, :in => %w(pending rejected accepted)
  validates_uniqueness_of :user_id,   scope: :friend_id
  validates_uniqueness_of :friend_id, scope: :user_id
end
