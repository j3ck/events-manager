class StaticPagesController < ApplicationController

	def home
		@events = Event.order("time ASC").take(5)
		@tags = Tag.order("created_at ASC")
		@top_users = top_users
	end

	private

	def top_users
		users = Hash.new
		User.all.each do |user|
			users[user] = user.participant_events.where(status: false).count
		end
		users = Hash[users.sort { |a,b| b[1] <=> a[1] }]
	end

end
