json.extract! trip_attachment, :id, :trip_id, :photo, :created_at, :updated_at
json.url trip_attachment_url(trip_attachment, format: :json)
