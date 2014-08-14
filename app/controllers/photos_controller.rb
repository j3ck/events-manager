class PhotosController < ApplicationController

	def create
		@photo = Photo.create(photo_params)
		@photo.save
		photo_html = render_to_string( :partial => 'photos/photo', :formats => [:html], :locals => { :photo => @photo } )
		render :json => { :photo_html => photo_html }
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
