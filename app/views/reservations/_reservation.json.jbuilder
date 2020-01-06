json.extract! reservation, :id, :reason, :state, :date, :start_time, :end_time, :person_id, :space_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
