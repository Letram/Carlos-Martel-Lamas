class Trip < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_many :posts
end
