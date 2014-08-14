class SearchController < ApplicationController

	def index
		if params[:q].present?
			if params[:section] == "all"
				@results = { events: Event, profiles: Profile, tags: Tag, categories: Category }
				@results.each { |k,v| @results[k] = v.search params[:q], limit: 2 }
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
end
