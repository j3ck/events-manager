class PlaylistsController < ApplicationController
  before_action :right_participant

  def show
    @playlist = Playlist.find(params[:id])
    client = Soundcloud.new(:client_id => '4ec6249c4fd3af29921b135fcb22c51d')
    if params[:query].present?
      @tracks = client.get('/tracks', :q => params[:query])
      # in alone def
      @tracks = @tracks.each do |track|
        track.track_id = track.id
      end
    else
      @tracks = @playlist.tracks
    end
  end

  private
    def right_participant
      @playlist = Playlist.find(params[:id])
      unless current_user.participations.find_by_event_id(@playlist.event_id) || current_user.events.find_by_id(@playlist.event_id)
        redirect_to root_path
      end
    end
end
