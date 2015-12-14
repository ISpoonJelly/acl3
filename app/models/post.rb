class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	scope :featured_post, -> {where(post_type: "Accomodation") }
end
