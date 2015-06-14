class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates_uniqueness_of :post, :scope => :user
end
