json.extract! image, :id, :filename, :rental_id, :created_at, :updated_at
json.url image_url(image, format: :json)