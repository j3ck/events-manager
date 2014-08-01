class SearchController < ApplicationController

	def index
		if params[:section] == "all"
			@events = Event.search params[:q], limit: 2
			@profiles = Profile.search params[:q], limit: 2
			@tags = Tag.search params[:q], limit: 2
			@categories = Category.search params[:q], limit: 2
		elsif params[:section] == "event"
			@events = Event.search params[:q]
		elsif params[:section] == "profile"
			@profiles = Profile.search params[:q]
		elsif params[:section] == "tag"
			@tags = Tag.search params[:q]
		elsif params[:section] == "category"
			@categories = Category.search params[:q]
		end
	end
end
