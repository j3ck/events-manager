json.array!(@events) do |event|
  json.extract! event, :id, :title, :status, :description
  json.url event_url(event, format: :json)
end
