class FriendLink < ActiveRecord::Base
  belongs_to :requester, class_name: 'User', foreign_key: 'requester_id'
  belongs_to :requested, class_name: 'User', foreign_key: 'requested_id'
  validates :requester_id,   presence: true
  validates :requested_id, presence: true
  validates_inclusion_of :status, :in => %w(pending rejected accepted)
  validates_uniqueness_of :requester_id, scope: :requested_id
  validates_uniqueness_of :requested_id, scope: :requester_id
end
