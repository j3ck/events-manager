json.array!(@playlists) do |playlist|
  json.extract! playlist, :id, :event_id
  json.url playlist_url(playlist, format: :json)
end
