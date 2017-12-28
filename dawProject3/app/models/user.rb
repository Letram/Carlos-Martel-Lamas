class User < ApplicationRecord
	has_one :profile
	has_many :trips
	has_many :comments, through: :trips
	has_many :posts
end
