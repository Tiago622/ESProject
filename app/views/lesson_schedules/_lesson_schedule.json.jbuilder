json.extract! lesson_schedule, :id, :lesson_id, :schedule_id, :created_at, :updated_at
json.url lesson_schedule_url(lesson_schedule, format: :json)
