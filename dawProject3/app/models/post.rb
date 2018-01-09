class Post < ApplicationRecord
	belongs_to :trip
	belongs_to :user

	scope :recent, ->{where("posts.created_at > ?", 6.months.ago).limit(3)}
end
