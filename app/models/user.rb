class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :posts
  has_many :likes

  #Friends
  #for friend request made by user
  has_many :friend_links, class_name: "FriendLink",
                          foreign_key: "requester_id",
                          dependent: :destroy
  has_many :requesteds, -> { where("friend_links.status" => "accepted") },
                      through: :friend_links, 
                      class_name: 'User',
                      foreign_key: 'requested_id',
                      foreign_type: 'requester_id'
  #for friend requests made by another person
  has_many :friended_links, class_name: "FriendLink",
                          foreign_key: "requested_id",
                          dependent: :destroy
  has_many :requesters, -> { where("friend_links.status" => "accepted") },
                      through: :friended_links, 
                      class_name: 'User', 
                      foreign_key: 'requester_id',
                      foreign_type: 'requester_id'

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
              format: { with: VALID_EMAIL_REGEX }


  def friends
    #friends will always have self.id as the user id as they were requests made by user
    #users 
    self.requesteds + self.requesters.where("users.id <> ?", self.id)
  end
end
