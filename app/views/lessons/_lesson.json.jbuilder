json.extract! lesson, :id, :name, :type_of_lesson, :weekday, :start_time, :end_time, :space_id, :person_id, :discipline_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
