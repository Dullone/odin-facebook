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
  has_many :friend_links, dependent: :destroy
  has_many :friends, -> { where("friend_links.status" => "accepted") },
                      through: :friend_links, 
                      class_name: 'User',
                      foreign_key: 'friend_id'
  #for friend requests made by another person
  has_many :friended_links, class_name: "FriendLink",
                          foreign_key: "friend_id",
                          dependent: :destroy
  has_many :users, -> { where("friend_links.status" => "accepted") },
                      through: :friended_links, 
                      class_name: 'User', 
                      foreign_key: 'user_id'

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
              format: { with: VALID_EMAIL_REGEX }


  def friended
    self.friends + self.users.where("users.id <> ?", self.id)
  end
end
