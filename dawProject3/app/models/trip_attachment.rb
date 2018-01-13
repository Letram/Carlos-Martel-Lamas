class TripAttachment < ApplicationRecord
	belongs_to :trip
	mount_uploader :photo, PhotoUploaderUploader
end
