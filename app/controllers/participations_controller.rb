class ParticipationsController < ApplicationController
	def create
		@participation = Participation.new(party_params)
		@participation.save
		redirect_to (:back)
	end

	private

	def party_params
		params.require(:participation).permit(:user_id, :event_id)
	end
end
