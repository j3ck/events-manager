class PhotosController < ApplicationController

	def create
		@photo = Photo.create(photo_params)
		@photo.save
		redirect_to :back
	end

	def destroy

	end

private

	def photo_params
		params.require(:photo).permit(:event_id, :photo)
	end

end