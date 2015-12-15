class Following < ActiveRecord::Base
	validates :follower_id, :uniqueness => {:scope => :user_id}

	belongs_to :user
	belongs_to :follower, :class_name => 'User'
end
