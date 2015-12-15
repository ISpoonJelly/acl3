class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :destination, :class_name => "User", :foreign_key => 'destination_post_id'
	has_many :comments

	scope :featured_post, -> {where(post_type: "Accomodation") }
end
