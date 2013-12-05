json.array!(@events) do |event|
  json.extract! event, :title, :starts_at
  json.url event_url(event, format: :json)
end
