class Profile < ApplicationRecord
	mount_uploader :profile_pic, ProfilePicUploader
	belongs_to :user

	def edit
		@profile = self
    	redirect_to root_path, alert: "No puedes hacer eso" unless @profile
	end
end
