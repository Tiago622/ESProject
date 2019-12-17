json.extract! lesson, :id, :name, :teacher, :school_year, :lesson_type, :weekday, :start_time, :end_time, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
