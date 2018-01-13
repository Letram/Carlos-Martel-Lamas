class PostAttachment < ApplicationRecord
	belongs_to :post
	mount_uploader :photo, PhotoUploaderUploader
end
