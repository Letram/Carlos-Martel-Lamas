json.extract! trip, :id, :from, :where, :start_date, :final_date, :created_at, :updated_at
json.url trip_url(trip, format: :json)
