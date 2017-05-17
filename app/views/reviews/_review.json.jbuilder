json.extract! review, :id, :overall, :price, :comment, :rental_id, :created_at, :updated_at
json.url review_url(review, format: :json)
