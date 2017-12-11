json.extract! photo, :id, :file_id, :classified_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
