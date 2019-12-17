json.extract! lesson, :id, :name, :lesson_type, :week_day, :start_time, :end_time, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
