json.extract! lesson, :id, :name, :type, :capacity, :availability, :equipment, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
