class ParticipationsController < ApplicationController
	def create
		@participation = Participation.new(party_params)
		@participation.save
		redirect_to (:back)
	end

	def destroy
		@participation = Participation.find(params[:id])
		#@participation = current_user.participations.find_by_event_id(params[:event_id])
		@participation.destroy
		redirect_to (:back)
	end

	private

	def party_params
		params.require(:participation).permit(:user_id, :event_id)
	end
end
