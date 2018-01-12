class Post < ApplicationRecord
	belongs_to :trip
	belongs_to :user, optional: true

	scope :recent, ->{where("posts.created_at > ?", 6.months.ago).limit(3)}

	def destroy
		self.destroy
	end
end
