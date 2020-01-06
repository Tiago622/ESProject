json.extract! person, :id, :name, :phone, :extension, :email, :cabinet, :job_title_1, :job_title_2, :job_title_3, :created_at, :updated_at
json.url person_url(person, format: :json)
