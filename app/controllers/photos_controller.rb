class PhotosController < ApplicationController

	def create
		@photo = Photo.create(photo_params)
		@photo.save
		redirect_to :back
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		redirect_to :back
	end

	def sort
		params[:photo].each_with_index do |id, index|
			photo = Photo.find(id)
			photo.update_attribute(:position, index) if photo
		end
		render nothing: true
	end

private

	def photo_params
		params.require(:photo).permit(:event_id, :photo)
	end

end