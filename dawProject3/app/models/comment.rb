class Comment < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :trip

	scope :recent, ->{where("comments.created_at > ?", 2.weeks.ago).limit(3)}
end
