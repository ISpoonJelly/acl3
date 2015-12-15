class Following < ActiveRecord::Base
	validates_uniqueness_of [:user, :follower]

	belongs_to :user
	belongs_to :follower, :class_name => 'User'
end
