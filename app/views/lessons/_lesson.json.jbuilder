<<<<<<< HEAD
json.extract! lesson, :id, :name, :lesson_type, :week_day, :start_time, :end_time, :created_at, :updated_at
=======
json.extract! lesson, :id, :name, :teacher, :school_year, :lesson_type, :weekday, :start_time, :end_time, :created_at, :updated_at
>>>>>>> JoaoFerreira
json.url lesson_url(lesson, format: :json)
